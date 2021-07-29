import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/http/services/authService.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/widget/btn_widget.dart';
import 'package:ha2/widget/header_container.dart';

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de compte'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 15),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          children: <Widget>[
            Column(
              children: <Widget>[
                HeaderContainer("Créer un compte"),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _textInput(hint: "Nom et Prénom", icon: Icons.person),
                        _textInput(
                            controller: mailController,
                            hint: "Email",
                            icon: Icons.email),
                        _textInput(hint: "Téléphone", icon: Icons.call),
                        _textInput(
                            controller: passController,
                            hint: "Password",
                            icon: Icons.vpn_key),
                        Expanded(
                          child: Center(
                            child: ButtonWidget(
                              btnText: "CREER",
                              onClick: () {
                                firebaseService.signUpEmailNameOnly(
                                    email: mailController.text,
                                    password: passController.text);
                              },
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
                                    text: "Déjà membre? ",
                                    style: TextStyle(color: Colors.black)),
                              ]),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Login()));
                                },
                                child: Text("Se connecter")),
                          ],
                        ),
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
}
