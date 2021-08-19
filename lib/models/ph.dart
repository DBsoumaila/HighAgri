import 'package:firebase_database/firebase_database.dart';

class PhValue {
  final String? id;
  final String ph;

  PhValue({required this.id, required this.ph});

  PhValue.fromSnapshot(DataSnapshot snapshot)
      : id = snapshot.key,
        ph = snapshot.value["soil_ph"].toString();

  toJson() {
    return {
      "ph": ph,
    };
  }
}
