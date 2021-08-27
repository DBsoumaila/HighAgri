import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ha2/camera/HomePage.dart';
import 'package:ha2/camera/camera.dart';
import 'package:ha2/errors/attente.dart';
import 'package:ha2/firestore/firedatalisttest.dart';
import 'package:ha2/firestore/serviceStore.dart';
import 'package:ha2/firestore/testDonnes.dart';
import 'package:ha2/http/pagesHttp/datatest.dart';
import 'package:ha2/http/pagesHttp/post_controller.dart';
import 'package:ha2/meteo/home/home_screen.dart';
import 'package:ha2/meteo/meteo.dart';
import 'package:ha2/meteo/weather_controller.dart';
import 'package:ha2/pages/authentification/forgeted.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/pages/authentification/splash.dart';
import 'package:ha2/pages/dashboard/dash.dart';
import 'package:ha2/pages/drawerPages/maladies.dart';
import 'package:ha2/pages/drawerPages/profil.dart';
import 'package:ha2/pages/drawerPages/services/coton.dart';
import 'package:ha2/pages/drawerPages/services/services.dart';
import 'package:ha2/pages/gallery/gallerypage.dart';
import 'package:ha2/pages/params/settings.dart';
import 'package:ha2/pages/profil/ajouterContact.dart';
import 'package:ha2/pages/profil/contacts.dart';
import 'package:ha2/pages/propos/apropos.dart';
import 'package:ha2/prediction/prediction.dart';
import 'package:ha2/realtime_database/areaChart.dart';
import 'package:ha2/realtime_database/linechart.dart';
import 'package:ha2/realtime_database/get_data.dart';
import 'package:ha2/realtime_database/rtime_test.dart';
import 'package:ha2/realtime_database/test.dart';
import 'package:ha2/realtime_database/testChart.dart';
import 'package:ha2/realtime_database/test_create_counter.dart';
import 'package:ha2/serviceAnalyse/services/analyse_apple.dart';
import 'package:ha2/welcome/page1.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'camera/global_library_file.dart' as globals;
import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import 'errors/erreur.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Toujours activer les parametres pour activer la camera

  //CAMERA

  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.

  final firstCamera = cameras.first;

  globals.cameraVak = firstCamera;
  //Firebase

// charts init

  //await Firebase.initializeApp();
//realtime database
  globals.appl = await Firebase.initializeApp();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'High Agri';
  //camera parameters

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) => FutureBuilder(
        // Initialisation de  FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Vérification des erreurs, s'il ya une erreur, charger la page d erreur
          if (snapshot.hasError) {
            return Erreur();
          }

          // Si flutterfire a bien démarré, lancer la page
          if (snapshot.connectionState == ConnectionState.done) {
            return PageUne();
          }

          // Sinon montrer cette page d'attente
          return Attente();
        },
      );
}
