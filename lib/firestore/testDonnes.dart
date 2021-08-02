import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInformation extends StatefulWidget {
  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: allData,
      child: Text(
        "Users",
      ),
    );
  }

  allData() {
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        //recuperation de donnes ici
        print(doc["nom"]);
        print(doc["prenom"]);
        print(doc["telephone"]);
        print(doc["email"]);
      });
    });
  }

  allData2() {
    _usersStream.toList();
  }
}
