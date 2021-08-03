// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math';

class TestChart extends StatefulWidget {
  const TestChart({Key? key, required this.app}) : super(key: key);
  final FirebaseApp app;

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<TestChart> {
  //air_humidite
  late DatabaseReference _airHumiditeRef;
  //mise en plqce des streams de donnees
  late StreamSubscription<Event> _airHumiditeSubscription;

  String _kTestKey = 'Hello';
  String _kTestValue = 'world!';
  String _ph = "pH";
  String _temp = "T(°C)";
  String _phosphore = "P";
  String _pnitrogene = "Nitrogene";
  String _irrigation = "Irrigation";
  String _airTemp = " T de l'air";
  String _humidite = "Hum.";
  DatabaseError? _error;

  @override
  void initState() {
    super.initState();

    // Demonstrates configuring the database directly
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    _airHumiditeRef = database.reference().child('air_humidity');

    database.reference().child('counter').get().then((DataSnapshot? snapshot) {
      print(
          'Connected to directly configured database and read ${snapshot!.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
  }

  @override
  void dispose() {
    super.dispose();
    _airHumiditeSubscription.cancel();
  }

  Timer? timer;
  List<SalesData> _chartData = <SalesData>[];
// Redraw the series with updating or creating new points by using this controller.
  ChartSeriesController? _chartSeriesController;
// Count of type integer which binds as x value for the series
  int count = 19;
  //Initialize the data source
  List<SalesData> chartData = <SalesData>[
    SalesData(0, 42),
    SalesData(1, 47),
    SalesData(2, 33),
    SalesData(3, 49),
    SalesData(4, 54),
    SalesData(5, 41),
    SalesData(6, 58),
    SalesData(7, 51),
    SalesData(8, 98),
    SalesData(9, 41),
    SalesData(10, 53),
    SalesData(11, 72),
    SalesData(12, 86),
    SalesData(13, 52),
    SalesData(14, 4),
    SalesData(15, 92),
    SalesData(16, 86),
    SalesData(17, 72),
    SalesData(18, 94),
  ];

  @override
  Widget build(BuildContext context) {
    // Here the _updateDataSource method is called for every second.
    timer =
        Timer.periodic(const Duration(milliseconds: 1000), _updateDataSource);

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
            dataSource: chartData,
            xValueMapper: (SalesData sales, _) => sales.minutes,
            yValueMapper: (SalesData sales, _) => sales.sales,
          )
        ],
      ),
    ));
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
    chartData.add(SalesData(count, double.parse(_airHumiditeRef.toString())));
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
  final double? sales;
}
