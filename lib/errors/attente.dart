import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/pages/authentification/signup.dart';
import 'package:ha2/widget/btn_widget.dart';
import 'package:ha2/widget/header_container.dart';

class Attente extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Veuillez patienter...'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          child: Text("Chargement..."),
        ),
      ));
}
