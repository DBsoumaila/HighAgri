import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/firestore/provider.dart';
import 'package:ha2/http/services/authService.dart';
import 'package:ha2/models/user.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/pages/profil/contacts.dart';
import 'package:ha2/widget/btn_widget.dart';
import 'package:ha2/widget/header_container.dart';
import 'package:ha2/firestore/fire_servicess.dart';
import 'package:uuid/uuid.dart';

class AjouterContact extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<AjouterContact> {
  final nomController = TextEditingController();
  final telController = TextEditingController();

  FirestoreService2 firebaseService = new FirestoreService2();
  UsertProvider service = new UsertProvider();
  var uuid = Uuid();

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference contacts =
      FirebaseFirestore.instance.collection('contacts');

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.

    telController.dispose();
    nomController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Création de contacts'),
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
                HeaderContainer("Créer un contact"),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        _textInput(
                            controller: nomController,
                            hint: "Nom et Prénom",
                            icon: Icons.person),
                        _textInput(
                            controller: telController,
                            hint: "Téléphone",
                            icon: Icons.call),
                        Expanded(
                          child: Center(
                            child: ButtonWidget(
                              btnText: "Ajouter",
                              onClick: () async {
                                //ensuite on ajoute l utilisateur a notre propre base de donees users et on redirige vers l authentificaion

                                addUser(nomController.text, telController.text)
                                    .then((value) => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Contacts())));
                              },
                            ),
                          ),
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

  Future<void> addUser(String nom, String telephone) {
    // Call the user's CollectionReference to add a new user
    return contacts
        .add({
          'nom': nom, // John Doe

          'telephone': telephone, // 42
        })
        .then((value) => print("Contact ajouté"))
        .catchError((error) => print("Erreurr: $error"));
  }

  Future<void> createUserForLogin(String emaild, String passwordd) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emaild, password: passwordd);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('...........Mot de passe faible.................');
      } else if (e.code ==
          '................email-already-in-use.............') {
        print(
            '.................The account already exists for that email................');
      }
    } catch (e) {
      print(e);
    }
  }
}
