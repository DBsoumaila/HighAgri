// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AreaCharts extends StatefulWidget {
  const AreaCharts({Key? key}) : super(key: key);

  @override
  _ChartsPageState createState() => _ChartsPageState();
}

class _ChartsPageState extends State<AreaCharts> {
  String hourTime(DateTime dateTime) {
    return '${dateTime.hour} H:${dateTime.minute} m:${dateTime.second} s';
  }

  int second(DateTime date) {
    return date.second;
  }

  final List<SalesData> chartData = [
    SalesData(DateTime.utc(2020), 35),
    SalesData(DateTime.utc(2021), 28),
    SalesData(DateTime.utc(2022), 34),
    SalesData(DateTime.utc(2023), 32),
    SalesData(DateTime.utc(2024), 40),
    SalesData(DateTime.utc(2025), 30),
    SalesData(DateTime.utc(2026), 32),
    SalesData(DateTime.utc(2027), 40),
    SalesData(DateTime.utc(2028), 10),
    SalesData(DateTime.utc(2029), 15),
    SalesData(DateTime.utc(2030), 40),
    SalesData(DateTime.utc(2031), 10),
    SalesData(DateTime.utc(2032), 15),
    SalesData(DateTime.utc(2033), 40),
  ];
  @override
  Widget build(BuildContext context) {
    String formatDatTime(DateTime dateTime) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }

    final List<Color> color = <Color>[];
    color.add(Colors.blue[50]!);
    color.add(Colors.blue[200]!);
    color.add(Colors.blue);

    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);

    final LinearGradient gradientColors =
        LinearGradient(colors: color, stops: stops);

    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: DateTimeAxis(),
                    series: <ChartSeries>[
          // Renders area chart
          AreaSeries<SalesData, DateTime>(
              dataSource: chartData,
              xValueMapper: (SalesData sales, _) => sales.minutes,
              yValueMapper: (SalesData sales, _) => sales.sales,
              gradient: gradientColors)
        ]))));
  }
}

class SalesData {
  SalesData(this.minutes, this.sales);
  final DateTime minutes;
  final double? sales;
}
