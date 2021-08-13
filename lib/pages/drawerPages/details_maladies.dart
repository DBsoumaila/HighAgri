import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ha2/camera/displayImage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';

class DetailsMaladies extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String auteur;
  final String groupe;
  final String description;
  final int id;
  DetailsMaladies(
      {required this.date,
      required this.auteur,
      required this.groupe,
      required this.description,
      required this.id,
      required this.imagePath,
      required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo$id',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 400,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          title,
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Par $auteur',
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          'Groupe:   ' + groupe + '    |  date:' + date,
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.green,
                          child: Text(
                            'Retour',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () async {},
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.green,
                          child: Text(
                            'Favoris',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('$path');

    final file = File('${(await getTemporaryDirectory()).path}');
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }
}
