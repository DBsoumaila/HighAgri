library my.globals;

import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ha2/realtime_database/area_humidite.dart';
import 'package:ha2/realtime_database/area_nitrogene.dart';
import 'package:ha2/realtime_database/area_potassium.dart';
import 'package:ha2/realtime_database/areachart_phosphore.dart';
import 'package:ha2/realtime_database/areachart_temperature.dart';
import 'package:ha2/realtime_database/phosphore_graphe.dart';

CameraDescription cameraVak = new CameraDescription(
    name: 'name',
    lensDirection: CameraLensDirection.front,
    sensorOrientation: 0);

late FirebaseApp appl;

String titre = '';
late int code = 0;
String date = '';
String message = '';
String headers = '';
bool isResponse = false;

//les valeurs dernieres et singulières a afficher
double ph = 0.0;
double humidite = 0.0;
double potassium = 0.0;
double phosphore = 0.0;
double temperature = 0.0;

//liste des valeurs

List<SalesData> phosphorevaleurs = [];

//area charts
List<SalesDatat> phosphorevaleursPh = [];
List<SalesDatat2> temperatureValeurs = [];
List<SalesDataNitrogene> nitrogeneeValeurs = [];
List<SalesDataPotass> potassValeurs = [];
List<SalesDataHumidite> humidValeurs = [];
