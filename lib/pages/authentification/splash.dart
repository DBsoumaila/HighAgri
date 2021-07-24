import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ha2/pages/authentification/login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(milliseconds: 4000), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          //faire  du dégradé
          gradient: LinearGradient(
              colors: [Colors.green, Colors.lightGreen],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
        ),
        child: Center(
          child: Image.asset("assets/images/logohagri.png"),
        ),
      ),
    );
  }
}