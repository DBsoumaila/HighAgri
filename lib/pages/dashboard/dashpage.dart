import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/camera/camera.dart';
import 'package:ha2/camera/displayImage.dart';
import 'package:ha2/pages/charts/phChart.dart';
import 'package:ha2/realtime_database/areaChart.dart';
import 'package:ha2/realtime_database/areachart_phosphore.dart';
import 'package:ha2/realtime_database/areachart_temperature.dart';
import 'package:ha2/realtime_database/humiditeGrap.dart';
import 'package:ha2/realtime_database/phosphore_graphe.dart';
import 'package:ha2/realtime_database/services_realtime.dart';
import 'package:ha2/realtime_database/testChart.dart';
import 'package:ha2/widget/navigation_drawer_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:ha2/camera/global_library_file.dart' as globals;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

//realtime database
  globals.appl = await Firebase.initializeApp();

  runApp(Dashboard());
}

class Dashboard extends StatelessWidget {
  static final String title = 'High Agri';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: DashBoardPage(),
      );
}

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final List _screens = [Scaffold(), Scaffold(), Scaffold(), Scaffold()];
  int _currentIndex = 0;

  late DatabaseReference _pHRef;
  late StreamSubscription<Event> _pHSubscription;

  //valeurs singulières du dashboard
  late double _ph = 0.0;
  late double _Phosphore = 0.1;
  late double _Humdid = 0.1;
  late double _temperature = 0.1;
  double test = 0.2;

  List humdvalues = [];
  List tempvalues = [];
  List phvalues = [];
  List phosphorevalues = [];

// charger toutes ces valeurs au démarrage
  @override
  void initState() {
    super.initState();

    String LASTMESSAGE = '';

    // Demonstrates configuring the database directly
    final FirebaseDatabase database = FirebaseDatabase(app: globals.appl);

    _pHRef = database.reference().child('soil_ph');
    _pHRef.orderByKey().limitToLast(1).onValue;

    Query query = _pHRef.orderByKey().limitToLast(1);
    print('Connected directly configured database and read ');

    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _setupPh();
    _setupPhosphore();
    _setupHumid();
    _setupTemperature();
  }

//initialiser la valeur de température
  _setupTemperature() async {
    double valeurfinale = 0.0;
    Query needsSnapshot = FirebaseDatabase.instance
        .reference()
        .child("air_temperature")
        .orderByKey();

    await needsSnapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //values ici c est toutes les valeurs de la base de donnes

      values.forEach((key, values) {
        valeurfinale = double.parse(values.toString());
        // print(valeurfinale.toString());
        tempvalues.add(valeurfinale);
      });
      //la dernierve valeur

      _temperature = tempvalues[tempvalues.length - 1];

      globals.temperature = _temperature;
    });

    setState(() {
      globals.temperature = _temperature;
    });
  }

//initialiser la valeur de phosphore
  _setupHumid() async {
    double valeurfinale = 0.0;
    Query needsSnapshot = FirebaseDatabase.instance
        .reference()
        .child("air_humidity")
        .orderByKey();

    await needsSnapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //values ici c est toutes les valeurs de la base de donnes

      values.forEach((key, values) {
        valeurfinale = double.parse(values.toString());
        // print(valeurfinale.toString());
        humdvalues.add(valeurfinale);
      });
      //la dernierve valeur

      _Humdid = humdvalues[humdvalues.length - 1];

      globals.humidite = _Humdid;
    });

    setState(() {
      globals.humidite = _Humdid;
    });
  }

//initialiser la valeur de phosphore
  _setupPhosphore() async {
    double valeurfinale = 0.0;
    Query needsSnapshot = FirebaseDatabase.instance
        .reference()
        .child("phosphorous_value")
        .orderByKey();

    await needsSnapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //values ici c est toutes les valeurs de la base de donnes

      values.forEach((key, values) {
        valeurfinale = double.parse(values.toString());
        // print(valeurfinale.toString());
        phosphorevalues.add(valeurfinale);
      });
      //la dernierve valeur

      _Phosphore = phosphorevalues[phosphorevalues.length - 1];

      globals.phosphore = _Phosphore;
    });

    setState(() {
      globals.phosphore = _Phosphore;
    });
  }

//initialiser la valeur de ph
  _setupPh() async {
    double valeurfinale = 0.0;
    Query needsSnapshot =
        FirebaseDatabase.instance.reference().child("soil_ph").orderByKey();

    await needsSnapshot.once().then((DataSnapshot snapshot) {
      Map<dynamic, dynamic> values = snapshot.value;
      //values ici c est toutes les valeurs de la base de donnes

      values.forEach((key, values) {
        valeurfinale = double.parse(values.toString());
        //  print(valeurfinale.toString());
        phvalues.add(valeurfinale);
      });
      //la dernierve valeur

      _ph = phvalues[phvalues.length - 1];
      //print('TTTTT' + phAprendre.toString());
      globals.ph = _ph;
    });

    setState(() {
      globals.ph = _ph;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pHSubscription.cancel();
  }

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

  var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0, -2.0, 3.5, -2.0, 0.5, 0.7, 0.8, 1.0, 2.0, 3.0, 3.2];

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

  Material myCircularItems(String title, String subtitle) {
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Hello'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material mychart1Items(String title, String priceVal, String subtitle) {
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
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(1.0), child: Text('Hi Its')),
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

  Material mychart2Items(String title, String priceVal, String subtitle) {
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
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      priceVal,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(1.0),
                      child: Container(
                        child: Text('Autres'),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material AreaChartTemperature(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Container(
                    height: 300, child: Center(child: TemperatureChartArea()))
                //Initialize the chart widget
              ],
            ),
          ),
        ),
      ),
    );
  }
  //Phosphore area

  Material AreaChartTempPhosphore(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Container(height: 200, child: Center(child: PhosphoreArea()))
                //Initialize the chart widget
              ],
            ),
          ),
        ),
      ),
    );
  }

  //to update datat  from data table

  Material AreaChartTemp(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(1.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),
                  ),
                ),
                Container(height: 200, child: Center(child: AreaCharts()))
                //Initialize the chart widget
              ],
            ),
          ),
        ),
      ),
    );
  }

  Material ChartPhEvolution(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Container(
                  height: 300.0,
                  child: Center(
                    child: HumiditeChart(app: globals.appl),
                  ),
                ),
              ),
            )
            //Initialize the chart widget
          ],
        ),
      )),
    );
  }

  // Graphe de visualisation de Phosphore
  Material ChartPhosphoreEvolution(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Container(
                  height: 300.0,
                  child: Center(
                    child: PhosphoreChart(app: globals.appl),
                  ),
                ),
              ),
            )
            //Initialize the chart widget
          ],
        ),
      )),
    );
  }

  Material ChartPhLive(String title) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(1.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            Container(
              child: Center(
                child: Container(
                  height: 300.0,
                  child: Center(
                    child: TestChart(app: globals.appl),
                  ),
                ),
              ),
            )
            //Initialize the chart widget
          ],
        ),
      )),
    );
  }

  //to update datat  from data table
  Material Chart(String title) {
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
                    padding: EdgeInsets.all(1.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),

                  //Initialize the chart widget
                ],
              ),
            ],
          ),
        ),
      ),
    );
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
              child: WelcomeItem("Bienvenue sur le dashboard", DateTime.now()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("Hum.", globals.humidite.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("pH", globals.ph.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: myTextItems("Phos", globals.phosphore.toString()),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child:
                      myTextItems("Temp(%C)", globals.temperature.toString()),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AreaChartTemp('Evolution de l\'humidité'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChartPhLive("Live  Humidité"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ChartPhEvolution("Graphe réel du pH"),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ChartPhosphoreEvolution("Evolution du  Phosphore")),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AreaChartTempPhosphore("Evolution du Phosphore"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AreaChartTemperature("Graphique de Température"),
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(4, 90.0),
            StaggeredTile.extent(4, 70), //row
            StaggeredTile.extent(4, 300.0),
            StaggeredTile.extent(4, 400.0),
            StaggeredTile.extent(4, 400.0),
            StaggeredTile.extent(4, 400.0),
            StaggeredTile.extent(4, 300.0),
            StaggeredTile.extent(4, 400.0),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TakePictureScreen(camera: globals.cameraVak)));
        },
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
