import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/http/services/authService.dart';
import 'package:ha2/pages/authentification/forgeted.dart';
import 'package:ha2/pages/authentification/signup.dart';
import 'package:ha2/pages/dashboard/dash.dart';
import 'package:ha2/widget/btn_widget.dart';
import 'package:ha2/widget/header_container.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final mailController = TextEditingController();
  final passController = TextEditingController();

  FirebaseService firebaseService = new FirebaseService();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Connexion'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            children: <Widget>[
              Column(
                children: <Widget>[
                  HeaderContainer("Authentification !"),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _textInput(
                            controller: mailController,
                            hint: "Email",
                            icon: Icons.email,
                          ),
                          _textInput(
                              controller: passController,
                              hint: "Password",
                              icon: Icons.vpn_key),
                          Expanded(
                            child: Center(
                              child: ButtonWidget(
                                onClick: () async {
                                  bool canGoToDash = false;
                                  try {
                                    //se connecter
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: mailController.text,
                                            password: passController.text);
                                    //on met a true si on n a pas rencontre d erreurs
                                    canGoToDash = true;
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == 'weak-password') {
                                      print('Faible mot de passe');

                                      //a chaque erreur on met a false
                                      canGoToDash = false;
                                    } else if (e.code ==
                                        'email-already-in-use') {
                                      print(
                                          'Ce compte eexiste déjà avec cet Email');
                                      // toast(
                                      //     'Un compte existe déjà avec cet Email');
                                      canGoToDash = false;
                                    } else if (e.code == 'wrong-password') {
                                      print("Password inccorect");

                                      canGoToDash = false;
                                      // toast('Passe incorrect !');
                                    } else if (e.code == 'invalid-email') {
                                      print("Email Incorrect");
                                      canGoToDash = false;
                                      // toast('Email incorrect !');
                                    } else if (e.code == 'user-disabled') {
                                      print("Utilisateur desactivee");
                                      canGoToDash = false;
                                      // toast('Cet utilisateur est désactivé');
                                    } else if (e.code == 'user-not-found') {
                                      print("Cet utilisateur n'existe pas !");
                                      canGoToDash = false;
                                      // toast('Utilisateur inexistant');
                                    } else {
                                      canGoToDash = false;
                                      // toast('Une erreur est survenuee!');
                                    }
                                  }

                                  //vérifier si l'utilisateur est bien rentré
                                  FirebaseAuth.instance
                                      .authStateChanges()
                                      .listen((User? user) {
                                    if (user == null) {
                                      print('L utilisateur n est pas connecté');
                                    } else if (canGoToDash) {
                                      print('Utilisateur connecté');
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DashboardPageControl()));
                                    }
                                  });
                                },
                                btnText: "LOGIN",
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: "Pas de compte ? ",
                                      style: TextStyle(color: Colors.black)),
                                ]),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RegPage()));
                                  },
                                  child: Text("Créer")),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 0.0),
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgetedPass()));
                                },
                                child: Text("Mot de passe oublié ?")),
                          ),
                          Column(
                              //implémenter le logi google et facebook ici
                              )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
            staggeredTiles: [
              StaggeredTile.extent(4, 650.0),
            ],
          ),
        ),
      );
}

Widget _textInput({controller, hint, icon}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    padding: EdgeInsets.only(left: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
    ),
  );
}

void toast(String nom) {
  Fluttertoast.showToast(
      msg: nom,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
