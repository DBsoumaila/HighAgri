import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ha2/models/imageModel.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:flutter/services.dart';

class DatabaseManager {
// gallery list
  final CollectionReference profileList =
      FirebaseFirestore.instance.collection('users');

  // gallery list
  final CollectionReference contacts =
      FirebaseFirestore.instance.collection('contacts');
  //une instance de firebase
  FirebaseFirestore _db = FirebaseFirestore.instance;
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');

// modifier des données
  Future updateUserList(
      String name, String gender, int score, String uid) async {
    return await profileList
        .doc(uid)
        .update({'name': name, 'gender': gender, 'score': score});
  }

  // ajouter un utilisateur
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
        .catchError((error) => print("Echec d'ajout: $error"));
  }

  // get gallery pictures from firebase
  Future getGalleryPicList() async {
    List pictures = [];

    try {
      await profileList.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          pictures.add(element.data());
        });
      });
      return pictures;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// get gallery pictures from firebase
  Future getContacts() async {
    List pictures = [];

    try {
      await contacts.get().then((querySnapshot) {
        querySnapshot.docs.forEach((element) {
          pictures.add(element.data());
        });
      });
      return pictures;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
