import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ha2/pages/authentification/splash.dart';
import 'package:ha2/pages/dashboard/dash.dart';
import 'package:ha2/pages/drawerPages/profil.dart';
import 'package:ha2/pages/gallery/gallerypage.dart';
import 'package:ha2/welcome/page1.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'High Agri';

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
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: DashboardPageControl(),
        ),
      );
}
