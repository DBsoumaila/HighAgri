import 'package:ha2/firestore/fire_servicess.dart';

class Userd {
  final String uid;
  final String nom;
  final String email;
  final String password;
  final String telephone;

  Userd(
      {required this.uid,
      required this.nom,
      required this.email,
      required this.telephone,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nom': nom,
      'email': email,
      'password': password,
      'telephone': telephone,
    };
  }

  Userd.fromFirestore(Map<String, dynamic> firestore)
      : uid = firestore['uid'],
        nom = firestore['nom'],
        email = firestore['email'],
        password = firestore['password'],
        telephone = firestore['telephone'];
}
