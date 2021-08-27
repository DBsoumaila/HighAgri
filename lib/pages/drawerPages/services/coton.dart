import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ha2/camera/camera.dart';
import 'package:cross_file/cross_file.dart';
import 'package:ha2/camera/displayImage.dart';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:ha2/models/imageModel.dart';
import 'package:ha2/pages/drawerPages/services/coton.dart';
import 'package:ha2/pages/gallery/gallerypage.dart' as imagesGal;
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

import 'package:ha2/camera/global_library_file.dart' as globals;

final TextEditingController maxWidthController = TextEditingController();
final TextEditingController maxHeightController = TextEditingController();
final TextEditingController qualityController = TextEditingController();
typedef void OnPickImageCallback(
    double? maxWidth, double? maxHeight, int? quality);
dynamic _pickImageError;
String? _retrieveDataError;
Text? _getRetrieveErrorWidget() {
  if (_retrieveDataError != null) {
    final Text result = Text(_retrieveDataError!);
    _retrieveDataError = null;
    return result;
  }
  return null;
}

class Coton extends StatefulWidget {
  late String? titre;
  late String? date;
  late String? reponse;
  late String? message;
  late int? code;
  late bool? isRes;

  Coton({
    Key? key,
    this.titre,
    this.date,
    this.reponse,
    this.message,
    this.isRes,
    this.code,
  }) : super(key: key);
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<Coton> {
  List<XFile>? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : [value];
  }

  Future<void> _displayPickImageDialog(
      BuildContext context, OnPickImageCallback onPick) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add optional parameters'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxWidth if desired"),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Enter maxHeight if desired"),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(hintText: "Enter quality if desired"),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('PICK'),
                  onPressed: () {
                    double? width = maxWidthController.text.isNotEmpty
                        ? double.parse(maxWidthController.text)
                        : null;
                    double? height = maxHeightController.text.isNotEmpty
                        ? double.parse(maxHeightController.text)
                        : null;
                    int? quality = qualityController.text.isNotEmpty
                        ? int.parse(qualityController.text)
                        : null;
                    onPick(width, height, quality);
                    Navigator.of(context).pop();
                  }),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) => Scaffold(

      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Services'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Analysez vos feuilles Cotons',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                      Card(
                        elevation: 7.0,
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text('Selectionnez une image'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //si c'est la camera
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      TakePictureScreen(
                                                          camera: globals
                                                              .cameraVak)));
                                        },
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.deepOrange,
                                        )),
                                    //si c est la gallery
                                    TextButton(
                                        onPressed: () {},
                                        child: Icon(Icons.collections_outlined))
                                  ],
                                )
                              ],
                            )),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            child: Icon(Icons.security_outlined),
                          ),
                        ],
                      ),
                      Container(
                        height: 300.0,
                        width: double.infinity,
                        child: Card(
                          elevation: 7.0,
                          child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  child: Center(
                                child: (globals.isResponse)
                                    ? Text('Vos résultats d\'analyse  ici')
                                    : ReponseDuServeur(titre, date),
                              ))),
                        ),
                      )
                    ])),
              ],
            )),
      ));
}

//envoie de post request qui marche correctement
Future<Response> postImageToBackendCoton(String urlImage) async {
  var formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(urlImage, filename: 'image.jpg'),
    // 'files': [
    //   await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
    //   await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
    // ]
  });
  var dio = Dio();
  var url = 'https://cotonapp7-ago324jaqa-ey.a.run.app';
  // var url = 'https://tomato-ago324jaqa-ey.a.run.app';
  var response = await dio.post(url, data: formData);
//initialiser les valeurs de retours
  globals.titre = response.data.toString().toUpperCase();
  globals.code = response.statusCode!;
  globals.message = response.statusMessage.toString();
  globals.headers = response.headers.toString();
  globals.date = response.headers.value('Date').toString();

  print("--------------------Retour du serveur");
  print("Titre:" + globals.titre);
  print("Headers:" + globals.headers);
  print("Code:${globals.code}");
  print("Message:" + globals.message);
  print("La date:${globals.date}");
  print('------------------ Retour Final ----------------');
  globals.isResponse = true;
  return response;
}
