import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ha2/models/user.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance.collection('users').snapshots();

Stream collectionStream =
    FirebaseFirestore.instance.collection('users').snapshots();

class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduct(User user) {
    return _db.collection('users').doc(user.id).set(user.toMap());
  }

  Stream<List<User>> getProducts() {
    return _db.collection('users').snapshots().map((snapshot) => snapshot.docs
        .map((document) => User.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeProduct(String productId) {
    return _db.collection('users').doc(productId).delete();
  }
}
