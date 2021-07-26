import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/pages/charts/phChart.dart';
import 'package:ha2/widget/navigation_drawer_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Gallery extends StatelessWidget {
  static final String title = 'High Agri';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: GalleryClass(),
      );
}

class GalleryClass extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<GalleryClass> {
  // données
  List<Ph> dataPh = [
    Ph("2021", 13, charts.ColorUtil.fromDartColor(Colors.blue)),
    Ph("2022", 10, charts.ColorUtil.fromDartColor(Colors.green)),
    Ph("2023", 20, charts.ColorUtil.fromDartColor(Colors.yellow)),
    Ph("2024", 5, charts.ColorUtil.fromDartColor(Colors.pink)),
    Ph("2025", 17, charts.ColorUtil.fromDartColor(Colors.black)),
    Ph("2026", 19, charts.ColorUtil.fromDartColor(Colors.green)),
    Ph("2027", 26, charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  Material myTextItems(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
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

  Material PhotoContenair(String title, String subtitle) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
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

  Material WelcomeItem(String nom, DateTime date) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      nom,
                      style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Text(
                            formatDatTime(date),
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(1.0),
                          child: Text(
                            hourTime(date),
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                      ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDatTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  String hourTime(DateTime dateTime) {
    return '${dateTime.hour} H:${dateTime.minute} m:${dateTime.second} s';
  }

  //to update datat  from data table

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      drawer: NavigationDrawerWidget(),
      // endDrawer: NavigationDrawerWidget(),

      body: Container(
        color: Color(0xffE5E5E5),
        child: StaggeredGridView.count(
          crossAxisCount: 4,
          crossAxisSpacing: 9.0,
          mainAxisSpacing: 9.0,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: WelcomeItem("Gallery Photos", DateTime.now()),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhotoContenair("", ""),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 90.0),
            StaggeredTile.extent(4, 250.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.photo_camera),
      ),
    );
  }
}

class Ph {
  Ph(this.year, this.valeur, this.barColor);
  final String year;
  final charts.Color barColor;
  final double valeur;
}
