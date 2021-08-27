// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ha2/camera/global_library_file.dart' as globals;

class PotassiumValue extends StatefulWidget {
  const PotassiumValue({Key? key}) : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<PotassiumValue> {
  String hourTime(DateTime dateTime) {
    return '${dateTime.hour} H:${dateTime.minute} m:${dateTime.second} s';
  }

  List<SalesDataPotass> maliste = [];
  int valeur = 1;

  @override
  void initState() {
    super.initState();

    initialiserValeurs();
  }

  Future<void> initialiserValeurs() async {
    Query needsSnapshot = FirebaseDatabase.instance
        .reference()
        .child("potassium_value")
        .orderByKey();

    await needsSnapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //values ici c est toutes les valeurs de la base de donnes

      values.forEach((key, values) {
        // print(valeurfinale.toString());
        maliste.add(
            SalesDataPotass(DateTime.now(), double.parse(values.toString())));
      });
    });

    setState(() {
      globals.potassValeurs = maliste;
    });
  }

  final List<SalesDataPotass> chartData = [];
  @override
  Widget build(BuildContext context) {
    String formatDatTime(DateTime dateTime) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }

    final List<Color> color = <Color>[];
    color.add(Colors.black);
    color.add(Colors.greenAccent);
    color.add(Colors.blue);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);

    return Scaffold(
        body: Card(
      elevation: 10.0,
      child: Center(
          child: Container(
              child: SfCartesianChart(
                  primaryXAxis: DateTimeAxis(),
                  series: <ChartSeries>[
            // Renders area chart
            AreaSeries<SalesDataPotass, DateTime>(
                dataSource: globals.potassValeurs,
                xValueMapper: (SalesDataPotass sales, _) => sales.minutes,
                yValueMapper: (SalesDataPotass sales, _) => sales.sales,
                gradient: gradientColors)
          ]))),
    ));
  }
}

class SalesDataPotass {
  SalesDataPotass(this.minutes, this.sales);
  final DateTime minutes;
  final double sales;
}
