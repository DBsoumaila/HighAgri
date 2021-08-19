import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/camera/camera.dart';
import 'package:cross_file/cross_file.dart';
import 'package:ha2/serviceAnalyse/services/analyse_apple.dart';
import 'package:ha2/serviceAnalyse/services/analyse_cerises.dart';
import 'package:ha2/serviceAnalyse/services/analyse_coton.dart';
import 'package:ha2/serviceAnalyse/services/analyse_fraise.dart';
import 'package:ha2/serviceAnalyse/services/analyse_mais.dart';
import 'package:ha2/serviceAnalyse/services/analyse_potato.dart';
import 'package:ha2/serviceAnalyse/services/analyse_raisin.dart';
import 'package:ha2/serviceAnalyse/services/analyse_tomate.dart';

import 'package:image_picker/image_picker.dart';
import 'package:ha2/camera/global_library_file.dart' as globals;

final TextEditingController maxWidthController = TextEditingController();
final TextEditingController maxHeightController = TextEditingController();
final TextEditingController qualityController = TextEditingController();

class ServicesPage extends StatefulWidget {
  const ServicesPage({
    Key? key,
  }) : super(key: key);
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Services D\'analyse'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: StaggeredGridView.count(crossAxisCount: 4, children: [
          Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Icon(
                Icons.security_outlined,
                color: Colors.green,
                size: 70.0,
              ),
              SizedBox(
                height: 40.0,
              ),
              Container(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse de coton'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child:
                                        Image.asset('assets/analyse/coton.jpg'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalyseCoton(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse des tomates'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/analyse/tomato.jpg'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalyseTomate(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse des Pommes'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/analyse/pommeanalyse.png'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalysePomme(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse des patates'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/analyse/patates.jpeg'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalysePotato(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse des cérises'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/analyse/cerises.jpg'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalyseCerise(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse de Maïs'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child:
                                        Image.asset('assets/analyse/mais.jpeg'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalyseMais(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse des Raisins'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/analyse/raisin-sante.jpg'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalyseRaisin(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Card(
                      elevation: 7.0,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Analyse des Fraises'),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Image de coton
                                  Container(
                                    height: 67,
                                    width: 100,
                                    child: Image.asset(
                                        'assets/analyse/fraisesfinal.jpg'),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .push(MaterialPageRoute(
                                          builder: (context) => AnalyseFraise(
                                              titre: '',
                                              headers: '',
                                              message: '',
                                              date: '',
                                              code: 0,
                                              isResOk: false),
                                        ));
                                      },
                                      child: Text('Analyser')),
                                ],
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                  ])),
            ],
          )
        ], staggeredTiles: [
          StaggeredTile.extent(4, 1100.0),
        ]),
      ));
}
