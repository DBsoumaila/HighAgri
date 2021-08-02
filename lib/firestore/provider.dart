import 'package:flutter/material.dart';
import 'package:ha2/firestore/fire_servicess.dart';
import 'package:ha2/models/user.dart';
import 'package:uuid/uuid.dart';

class UsertProvider with ChangeNotifier {
  final firestoreService = FirestoreService();
  late String _nom;
  late String _prenom;
  late String _id;
  late String _email;
  late String _telephone;
  late String _password;
  late int _age;

  var uuid = Uuid();

  //Getters
  String get nom => _nom;
  String get prenom => _prenom;
  int get age => _age;
  String get password => _password;
  String get telephone => _telephone;
  String get email => _email;
  String get idT => _id;

  //Setters
  changeName(String value) {
    _nom = value;
    notifyListeners();
  }

  loadValues(User product) {
    _nom = product.nom;
    _prenom = product.prenom;
    _id = product.id;
  }

  saveProduct() {
    print(_id);
    if (_id == null) {
      var newProduct = User(
          id: uuid.v4(),
          nom: nom,
          prenom: prenom,
          age: age,
          email: email,
          telephone: telephone,
          password: password);
      firestoreService.saveProduct(newProduct);
    } else {
      //Update
/*
      var updatedProduct =
          User(name: name, price: _price, productId: _productId);
      firestoreService.saveProduct(updatedProduct);
      */
    }
  }

  removeProduct(String productId) {
    firestoreService.removeProduct(productId);
  }
}
