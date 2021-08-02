import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String nom;
  final String prenom;
  final int age;
  final String email;
  final String password;
  final String telephone;

//real timz data add and read
  Stream collectionStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  Stream documentStream =
      FirebaseFirestore.instance.collection('users').doc('ABC123').snapshots();

  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  AddUser(this.nom, this.prenom, this.email, this.telephone, this.age,
      this.password);

  @override
  Widget build(BuildContext context) {
    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .add({
            'nom': nom, // John Doe
            'prenom': prenom, // Stokes and Sons
            'age': age, // 42
            'email': email, // 42
            'telephone': telephone, // 42
            'password': password // 42
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }

  Future<void> ajouterUser(nom, prenom, email, age, telephone, password) {
    // Call the user's CollectionReference to add a new user
    return users
        .add({
          'nom': nom, // John Doe
          'prenom': prenom, // Stokes and Sons
          'age': age, // 42
          'email': email, // 42
          'telephone': telephone, // 42
          'password': password // 42
        })
        .then((value) => print("Utilisateur ajouté"))
        .catchError((error) => print("Echec d'ahout: $error"));
  }
}