import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/models/imageModel.dart';
import 'package:ha2/pages/gallery/imageDetail.dart';
import 'package:ha2/pages/propos/team.dart';

//données venant du hhtp

import 'package:http/http.dart' as http;

class DataHttp extends StatelessWidget {
  Material myTextItems(String title, String subtitle, IconData icon) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      icon,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material HighDescription(String description) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20.0)),
      shadowColor: Color(0x802196F3),
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            description,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A propos '),
      ),
      backgroundColor: Colors.green,
      body: Container(
        child: StaggeredGridView.count(
          crossAxisCount: 1,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  'A propos',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: myTextItems('High Agri', 'La startup en feu',
                            Icons.local_fire_department_outlined),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HighDescription(
                      'Bonjour cher client, votre geande Entreprise High Agri est la pour vous faciliter la tache   High Agri est la pour vous faciliter la tache  High Agri est la pour vous faciliter la tache  High Agri est la pour vous faciliter la tache '),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: myTextItems(
                        "Squad", 'High Agri', Icons.groups_outlined),
                  ),
                ),
              ],
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 1000.0),
          ],
        ),
      ),
    );
  }
}
