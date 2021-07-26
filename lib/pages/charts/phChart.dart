
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ha2/pages/dashboard/dashpage.dart';


class PhChart extends StatelessWidget {
  final List<Ph> data;
  String titre;

  PhChart({ required this.data, required this.titre});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Ph, String>> series = [
      charts.Series(
        id: titre,
        data: data,
        domainFn: (Ph series, _) => series.year,
        measureFn: (Ph series, _) => series.valeur,
        colorFn: (Ph series, _) => series.barColor
      )
    ];
    return Container(
      height: 170.0,
      width: 300,
      padding: EdgeInsets.all(8.0),
      child: Card(
        shadowColor: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                titre,
                style: Theme.of(context).textTheme.body2,
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );

  }
}