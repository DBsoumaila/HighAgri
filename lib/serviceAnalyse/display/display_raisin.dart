// A widget that displays the picture taken by the user.
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:camera/camera.dart';
import 'package:flutter/services.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:ha2/models/imageModel.dart';
import 'package:ha2/pages/drawerPages/services/coton.dart';
import 'package:ha2/pages/gallery/gallerypage.dart' as imagesGal;
import 'package:ha2/serviceAnalyse/services/analyse_apple.dart';
import 'package:ha2/serviceAnalyse/services/analyse_cerises.dart';
import 'package:ha2/serviceAnalyse/services/analyse_coton.dart';
import 'package:ha2/serviceAnalyse/services/analyse_potato.dart';
import 'package:ha2/serviceAnalyse/services/analyse_raisin.dart';
import 'package:http/http.dart' as http;
import 'package:ha2/camera/global_library_file.dart' as globals;
import 'package:path/path.dart';

class DisplayRaisin extends StatelessWidget {
  final String imagePath;

  DisplayRaisin({Key? key, required this.imagePath}) : super(key: key);

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
              onPressed: () async {
                await postImageToBackend(imagePath);

                print("--------------------Verification des valeurs");
                print("Titre:" + globals.titre);
                print("Headers:" + globals.headers);
                print("Code:${globals.code}");
                print("Message:" + globals.message);
                print("La date:${globals.date}");
                print('------------------ Retour Final ----------------');

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnalyseRaisin(
                              code: globals.code,
                              date: globals.date,
                              headers: globals.headers,
                              message: globals.message,
                              titre: globals.titre,
                              isResOk: true,
                            )));
              },
              child: Icon(Icons.security_outlined),
            ),
          ],
        )
      ])),
    );
  }
}

Future<Traitement> createAlbum(String imagePath, bool? verif) async {
  final response = await http.post(
    Uri.parse('https://cotonapp7-ago324jaqa-ey.a.run.app/'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{'image': imagePath}),
  );

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Traitement.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create Traitement.');
  }
}

//envoie de post request qui marche correctement
Future<Response> postImageToBackend(String urlImage) async {
  var formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(urlImage, filename: 'image.jpg'),
    // 'files': [
    //   await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
    //   await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
    // ]
  });
  var dio = Dio();
  var url = 'https://cherry-ago324jaqa-ey.a.run.app';
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
  return response;
}

Future<http.Response> postRequestToBackend(String urlImage) async {
  var url = 'https://cherry-ago324jaqa-ey.a.run.app';

  Map data = {'image': urlImage};
  //encode Map to JSON
  var body = json.encode(data);

  var response = await http.post(Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body);
  print("Le statut: ${response.statusCode}");
  print("La reponse: ${response.body}");

  return response;
}

class Traitement {
  final String title;
  final String image;

  Traitement({required this.title, required this.image});

  factory Traitement.fromJson(Map<String, dynamic> json) {
    return Traitement(title: json['title'], image: json['image']);
  }
}
