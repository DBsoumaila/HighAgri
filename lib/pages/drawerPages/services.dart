import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ha2/camera/camera.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ha2/camera/global_library_file.dart' as globals;

class ServicesPage extends StatefulWidget {
  const ServicesPage({
    Key? key,
  }) : super(key: key);
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  late File? imageToServer = null;

  final piker = ImagePicker();
  chooseImage(ImageSource imageSource) async {
    final pickedImage = await piker.pickImage(source: imageSource);
    setState(() {
      imageToServer = File(pickedImage!.path);
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
                      'Analysez  vos images pour détecter si vos plantes sont malades',
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
                                Text('Selectionnez une image'),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //si c'est la gallery
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
                                    //si c est la camera
                                    TextButton(
                                        onPressed: () {
                                          chooseImage(ImageSource.gallery);
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
                        height: 200.0,
                        width: double.infinity,
                        child: Card(
                          elevation: 7.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: imageToServer != null
                                ? Container(
                                    height: 200.0,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(imageToServer!))),
                                  )
                                : Container(
                                    height: 200,
                                  ),
                          ),
                        ),
                      )
                    ])),
              ],
            )),
      ));
}
