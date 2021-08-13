import 'package:flutter/material.dart';
import 'package:ha2/firestore/fire_servicess.dart';
import 'package:ha2/models/user.dart';
import 'package:uuid/uuid.dart';

class UsertProvider with ChangeNotifier {
  final firestoreService = FirestoreService2();
  late String _nom;
  late String _id;
  late String _email;
  late String _telephone;
  late String _password;

  var uuid = Uuid();

  //Getters
  String get nom => _nom;
  String get password => _password;
  String get telephone => _telephone;
  String get email => _email;
  String get idT => _id;

  //Setters
  changeName(String value) {
    _nom = value;

    notifyListeners();
  }

  loadValues(Userd product) {
    _nom = product.nom;
  }

  saveProduct() {
    print(_id);
    if (_id == null) {
      var newProduct = Userd(
          uid: uuid.v4(),
          nom: nom,
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
