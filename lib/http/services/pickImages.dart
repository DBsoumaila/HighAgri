// A widget that displays the picture taken by the user.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerImage extends StatefulWidget {
  @override
  _PickerImageState createState() => _PickerImageState();
}

class _PickerImageState extends State<PickerImage> {
  late File imaget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: imaget == Null
            ? Text('Selectionnez une Image')
            : Center(
                child: Image.file(imaget),
              ));
  }
}
