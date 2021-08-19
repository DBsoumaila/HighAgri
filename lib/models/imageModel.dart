import 'package:flutter/material.dart';

class ImgData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ImageDetails {
  final String imagePath;
  final String price;
  final String photographer;
  final String title;
  final String details;
  ImageDetails({
    required this.imagePath,
    required this.price,
    required this.photographer,
    required this.title,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'imagePath': imagePath,
      'price': price,
      'photographer': photographer,
      'title': title,
      'details': details,
    };
  }

  ImageDetails.fromFirestore(Map<String, dynamic> firestore)
      : imagePath = firestore['imagePath'],
        price = firestore['price'],
        photographer = firestore['photographer'],
        title = firestore['title'],
        details = firestore['details'];
}
