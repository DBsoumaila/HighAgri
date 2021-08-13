import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ha2/models/user.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final Stream<QuerySnapshot> _usersStream =
    FirebaseFirestore.instance.collection('users').snapshots();

final FirebaseAuth auth = FirebaseAuth.instance;
final uid = auth.currentUser!.uid;

Stream collectionStream =
    FirebaseFirestore.instance.collection('users').snapshots();

class FirestoreService2 {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveProduct(Userd user) async {
    return _db.collection('users').doc(uid).set(user.toMap());
  }

  Stream<List<Userd>> getProducts() {
    return _db.collection('users').snapshots().map((snapshot) => snapshot.docs
        .map((document) => Userd.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeProduct(String productId) {
    return _db.collection('users').doc(productId).delete();
  }
}
