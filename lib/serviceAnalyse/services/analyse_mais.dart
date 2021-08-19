import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ha2/camera/camera.dart';
import 'package:cross_file/cross_file.dart';
import 'package:ha2/serviceAnalyse/takepicture/take_apple_picture.dart';
import 'package:ha2/serviceAnalyse/takepicture/take_coton_picture.dart';
import 'package:ha2/serviceAnalyse/takepicture/take_mais.dart';
import 'package:ha2/serviceAnalyse/takepicture/take_potato_cerise.dart';
import 'package:ha2/serviceAnalyse/takepicture/take_potato_picture.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ha2/camera/global_library_file.dart' as globals;
import 'package:path/path.dart';

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

class AnalyseMais extends StatefulWidget {
  final String titre;
  final String headers;
  final String message;
  final String date;
  final int code;
  final bool isResOk;

  const AnalyseMais(
      {Key? key,
      required this.titre,
      required this.headers,
      required this.message,
      required this.date,
      required this.code,
      required this.isResOk})
      : super(key: key);

  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<AnalyseMais> {
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
            title: Text('Paramètres additionnels'),
            content: Column(
              children: <Widget>[
                TextField(
                  controller: maxWidthController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Entrez maxWidth (optionnel)"),
                ),
                TextField(
                  controller: maxHeightController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  decoration:
                      InputDecoration(hintText: "Entrez maxHeight (optionnel)"),
                ),
                TextField(
                  controller: qualityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Entrez la  qualité (optionnel)"),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Annuler'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  child: const Text('Prendre'),
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

  Widget _previewImages() {
    final Text? retrieveError = _getRetrieveErrorWidget();
    if (retrieveError != null) {
      return retrieveError;
    }
    if (_imageFileList != null) {
      return Semantics(
          child: ListView.builder(
            key: UniqueKey(),
            itemBuilder: (context, index) {
              // Why network for web?
              // See https://pub.dev/packages/image_picker#getting-ready-for-the-web-platform
              return Semantics(
                label: 'image_picker_example_picked_image',
                child: kIsWeb
                    ? Image.network(_imageFileList![index].path)
                    : Image.file(File(_imageFileList![index].path)),
              );
            },
            itemCount: _imageFileList!.length,
          ),
          label: 'image_picker_example_picked_images');
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'Aucune image sélectionnée pour l\'instant!',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget vueCamera(BuildContext context) {
    return ReponseDuServeur(
        context, widget.titre, widget.code, widget.message, widget.date);
  }

  final ImagePicker piker = ImagePicker();
  void _onImageButtonPressed(ImageSource source,
      {BuildContext? context, bool isMultiImage = false}) async {
    if (isMultiImage) {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final pickedFileList = await piker.pickMultiImage(
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFileList = pickedFileList;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    } else {
      await _displayPickImageDialog(context!,
          (double? maxWidth, double? maxHeight, int? quality) async {
        try {
          final pickedFile = await piker.pickImage(
            source: source,
            maxWidth: maxWidth,
            maxHeight: maxHeight,
            imageQuality: quality,
          );
          setState(() {
            _imageFile = pickedFile;
          });
        } catch (e) {
          setState(() {
            _pickImageError = e;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Services de Maïs'),
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
                      'Analysez  vos Maïs',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
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
                                Text('Images de Maïs'),
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
                                                      TakeMais(
                                                          camera: globals
                                                              .cameraVak)));
                                        },
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.deepOrange,
                                        )),
                                    //si c est la gallery
                                    TextButton(
                                        onPressed: () {
                                          _onImageButtonPressed(
                                              ImageSource.gallery,
                                              context: context);
                                        },
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
                                child: (widget.isResOk == true)
                                    ? vueCamera(context)
                                    : Center(
                                        child: Text(
                                            'Aucune analyse effectuée pour l\'instant !')),
                                height: double.infinity,
                              )),
                        ),
                      )
                    ])),
              ],
            )),
      ));
}

Widget ReponseDuServeur(
    BuildContext context, titre, int statut, reponse, date) {
  return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Text(
          titre,
          style: TextStyle(fontSize: 20, color: Colors.green),
        );
      });
}
