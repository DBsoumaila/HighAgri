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
import 'dart:math';

class PhosphoreChart extends StatefulWidget {
  const PhosphoreChart({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<PhosphoreChart> {
  //air_humidite
  late DatabaseReference _phosphoreRef;
  //mise en plqce des streams de donnees
  late StreamSubscription<Event> _phosphoreSubscription;

  String _phosphore = "P";
  DatabaseError? _error;
  int tallemax = 0;
  List<SalesData> phosporeValues = [];

  @override
  void initState() {
    super.initState();

    // Demonstrates configuring the database directly
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _phosphoreRef = database.reference().child('phosporous_value');

    database.reference().child('counter').get().then((DataSnapshot? snapshot) {
      tallemax = snapshot!.value;
      print('Connecté et lu : ' + tallemax.toString() + ' valeurs.');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _setupPhosphoreValues();
  }

  @override
  void dispose() {
    super.dispose();
    _phosphoreSubscription.cancel();
  }

  Timer? timer;
  List<SalesData> _chartData = <SalesData>[];
// Redraw the series with updating or creating new points by using this controller.
  ChartSeriesController? _chartSeriesController;
// Count of type integer which binds as x value for the series
  int count = 19;
  //Initialize the data source
  List<SalesData> chartData = <SalesData>[
    SalesData(18, 94),
    SalesData(10, 10),
  ];

  @override
  Widget build(BuildContext context) {
    // Here the _updateDataSource method is called for every second.
    // timer =
    //     Timer.periodic(const Duration(milliseconds: 1000), _updateDataSource);

    //On appel la fonction de recuperation tant qu il y a encore de donnees
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      while (!(chartData.length == tallemax)) {
        _updateDataSourceFromFire(timer);
      }
    });

    return Scaffold(
        body: Center(
      child: SfCartesianChart(
        series: <LineSeries<SalesData, int>>[
          LineSeries<SalesData, int>(
            onRendererCreated: (ChartSeriesController controller) {
              // Assigning the controller to the _chartSeriesController.
              _chartSeriesController = controller;
            }
            // Binding the chartData to the dataSource of the line series.
            ,
            dataSource: globals.phosphorevaleurs,
            xValueMapper: (SalesData sales, _) => sales.minutes,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    ));
  }

//initialiser la valeur de température
  _setupPhosphoreValues() async {
    int valeurs = 1;
    double valeurfinale = 0.0;
    Query needsSnapshot = FirebaseDatabase.instance
        .reference()
        .child("phosphorous_value")
        .orderByKey();

    await needsSnapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //values ici c est toutes les valeurs de la base de donnes
      print('VALEURS DE PHOPHORE:' + values.toString());

      values.forEach((key, values) {
        valeurfinale = double.parse(values.toString());
        print(valeurfinale.toString());
        phosporeValues.add(new SalesData(valeurs, valeurfinale));
        valeurs++;
      });

      //la dernierve valeur
    });

    setState(() {
      globals.phosphorevaleurs = phosporeValues;
    });
  }

  void _updateDataSource(Timer timer) {
    chartData.add(SalesData(count, 10 + Random().nextInt(100).toDouble()));
    if (chartData.length == 20) {
      // Removes the last index data of data source.
      chartData.removeAt(0);
      // Here calling updateDataSource method with addedDataIndexes to add data in last index and removedDataIndexes to remove data from the last.
      _chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
          removedDataIndexes: <int>[0]);
    }
    count = count + 1;
  }

  void _updateDataSourceFromFire(Timer timer) {
    chartData.add(SalesData(count, 1.0));

    if (chartData.length == 20) {
      // Removes the last index data of data source.
      chartData.removeAt(0);
      // Here calling updateDataSource method with addedDataIndexes to add data in last index and removedDataIndexes to remove data from the last.
      _chartSeriesController?.updateDataSource(
          addedDataIndexes: <int>[chartData.length - 1],
          removedDataIndexes: <int>[0]);
    }
    count = count + 1;
  }
}

class SalesData {
  SalesData(this.minutes, this.sales);
  final int minutes;
  final double sales;
}
