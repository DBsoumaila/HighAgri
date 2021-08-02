class User {
  final String id;
  final String nom;
  final String prenom;
  final int age;
  final String email;
  final String password;
  final String telephone;

  User(
      {required this.id,
      required this.nom,
      required this.prenom,
      required this.age,
      required this.email,
      required this.telephone,
      required this.password});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'password': password,
      'age': age,
      'telephone': telephone,
    };
  }

  User.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        nom = firestore['nom'],
        prenom = firestore['prenom'],
        email = firestore['email'],
        password = firestore['password'],
        age = firestore['age'],
        telephone = firestore['telephone'];
}
