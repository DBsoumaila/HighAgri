import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ha2/widget/profil_pic_widget.dart';

class Contacts extends StatelessWidget {
  List<ProfilElements> mesContacts = [
    ProfilElements(
      num: "96 58 45 78 95",
      icon: Icons.person_outline,
      nom: 'Mon compte',
      onpress: () {},
    ),
    //Element mon compte
    ProfilElements(
      nom: "Toto Frede",
      num: "789 45 20 325 ",
      icon: Icons.person_outline,
      onpress: () {},
    ),
    //Element mon compte
    ProfilElements(
      nom: "Soumaila",
      num: "78 20 85 96 54",
      icon: Icons.person_outline,
      onpress: () {},
    ),
    //Element mon compte
    ProfilElements(
      icon: Icons.person_outline,
      nom: "Khalil M.",
      num: "06 25 85 96 78 ",
      onpress: () {},
    ),
    //Element mon compte
    ProfilElements(
      nom: "Meryem E.",
      num: "78 25 26 14 15",
      icon: Icons.person_outline,
      onpress: () {},
    ),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Mes contacts'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: VueInitiale(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.green,
          child: Icon(
            Icons.person_add_alt_outlined,
          ),
        ),
      );
}

class VueInitiale extends StatelessWidget {
  const VueInitiale({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.count(
        crossAxisCount: 4,
        crossAxisSpacing: 9.0,
        mainAxisSpacing: 9.0,
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              //Element mon compte
              ProfilElements(
                num: "96 58 45 78 95",
                icon: Icons.person_outline,
                nom: 'Mon compte',
                onpress: () {},
              ),
              //Element mon compte
              ProfilElements(
                nom: "Toto Frede",
                num: "789 45 20 325 ",
                icon: Icons.person_outline,
                onpress: () {},
              ),
              //Element mon compte
              ProfilElements(
                nom: "Soumaila",
                num: "78 20 85 96 54",
                icon: Icons.person_outline,
                onpress: () {},
              ),
              //Element mon compte
              ProfilElements(
                icon: Icons.person_outline,
                nom: "Khalil M.",
                num: "06 25 85 96 78 ",
                onpress: () {},
              ),
              //Element mon compte
              ProfilElements(
                nom: "Meryem E.",
                num: "78 25 26 14 15",
                icon: Icons.person_outline,
                onpress: () {},
              ),
              //Element mon compte
              ProfilElements(
                num: "78 02 65 95 41",
                icon: Icons.person_outline,
                nom: "Aymane H.",
                onpress: () {},
              ),
            ],
          ),
        ],
        staggeredTiles: [
          //on fait scroller tout le Row jusqu'à 800pixels
          StaggeredTile.extent(4, 800.0),
        ],
      ),
    );
  }
}

class ProfilElements extends StatelessWidget {
  const ProfilElements({
    Key? key,
    required this.num,
    required this.icon,
    required this.nom,
    required this.onpress,
  }) : super(key: key);

  //définition des paramètrees à utiliser pour les autres elements
  final String num;
  final IconData icon;
  final String nom;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: FlatButton(
          color: Colors.cyan,
          padding: EdgeInsets.all(20.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: onpress,
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.black,
              ),
              SizedBox(width: 15),
              //etendre tout le text au milieu
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      nom,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    Text(
                      num,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ],
                ),
              ),
              //placer l'con à la fin à droite donc
              Icon(
                Icons.phone_enabled_outlined,
              ),
            ],
          )),
    );
  }
}
