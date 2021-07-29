// A widget that displays the picture taken by the user.
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:ha2/models/imageModel.dart';
import 'package:ha2/pages/gallery/gallerypage.dart' as imagesGal;

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(children: [
        Expanded(
            child: Card(
                margin: EdgeInsets.all(10.0),
                elevation: 7.0,
                child: Image.file(File(imagePath)))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //les actions a mener sur une image
            TextButton(
              onPressed: () {},
              child: Icon(Icons.delete_outline),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.history_outlined),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(Icons.task_alt_outlined),
            ),
            TextButton(
              onPressed: () {},
              child: Icon(Icons.security_outlined),
            ),
          ],
        )
      ])),
    );
  }
}
