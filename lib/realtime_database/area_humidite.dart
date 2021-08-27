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

class HumiditeDuSol extends StatefulWidget {
  const HumiditeDuSol({Key? key}) : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<HumiditeDuSol> {
  String hourTime(DateTime dateTime) {
    return '${dateTime.hour} H:${dateTime.minute} m:${dateTime.second} s';
  }

  List<SalesDataHumidite> maliste = [];
  int valeur = 1;

  @override
  void initState() {
    super.initState();

    initialiserValeurs();
  }

  Future<void> initialiserValeurs() async {
    Query needsSnapshot = FirebaseDatabase.instance
        .reference()
        .child("soil_moisture")
        .orderByKey();

    await needsSnapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //values ici c est toutes les valeurs de la base de donnes

      values.forEach((key, values) {
        // print(valeurfinale.toString());
        maliste.add(
            SalesDataHumidite(DateTime.now(), double.parse(values.toString())));
      });
    });

    setState(() {
      globals.humidValeurs = maliste;
    });
  }

  final List<SalesDataHumidite> chartData = [];
  @override
  Widget build(BuildContext context) {
    String formatDatTime(DateTime dateTime) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }

    final List<Color> color = <Color>[];
    color.add(Colors.amberAccent);
    color.add(Colors.purpleAccent);
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
            AreaSeries<SalesDataHumidite, DateTime>(
                dataSource: globals.humidValeurs,
                xValueMapper: (SalesDataHumidite sales, _) => sales.minutes,
                yValueMapper: (SalesDataHumidite sales, _) => sales.sales,
                gradient: gradientColors)
          ]))),
    ));
  }
}

class SalesDataHumidite {
  SalesDataHumidite(this.minutes, this.sales);
  final DateTime minutes;
  final double sales;
}
