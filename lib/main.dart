import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ha2/camera/camera.dart';
import 'package:ha2/http/pagesHttp/datatest.dart';
import 'package:ha2/http/pagesHttp/post_controller.dart';
import 'package:ha2/pages/authentification/forgeted.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/pages/authentification/splash.dart';
import 'package:ha2/pages/dashboard/dash.dart';
import 'package:ha2/pages/drawerPages/profil.dart';
import 'package:ha2/pages/gallery/gallerypage.dart';
import 'package:ha2/pages/params/settings.dart';
import 'package:ha2/pages/propos/apropos.dart';
import 'package:ha2/welcome/page1.dart';
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
  await Firebase.initializeApp();
  //await Firebase.initializeApp();

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
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Erreur();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Login();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return PageUne();
        },
      );
}
