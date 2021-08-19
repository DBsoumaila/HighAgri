import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/pages/authentification/splash.dart';

class PageUnePrincipale extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text("Bienvenue"),
          actions: [
            Image.asset('assets/images/logohagri.png'),
          ],
        ),

        body: Center(
          child: PageUne(),
        ),
      );
}

class PageUne extends StatefulWidget {
  @override
  _PageUneState createState() => _PageUneState();
}

class _PageUneState extends State<PageUne> {
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          //on peut scroller verticalement ou horizontalement en utilisant scrolldirection
          pageSnapping: true,
          controller: pageController,
          //when the page changed, we get its index
          onPageChanged: (index) {
            setState(() {
              pageChanged = index;
            });
          },
          children: [
            //page 1
            Container(
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 200,
                      child: Image.asset('assets/images/logohagri.png'),
                    ),

                    Card(
                      margin: EdgeInsets.only(bottom: 30.0, top: 10.0),
                      elevation: 10.0,
                      shadowColor: Colors.black,
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Maladies et Détection',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.50,
                              color: Colors.white,
                            )),
                      ),
                    ),

                    Card(
                      margin: EdgeInsets.only(bottom: 10.0, top: 15.0),
                      elevation: 10.0,
                      shadowColor: Colors.black,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            "Détectez facilement si vos plantes sont atteintes de maladies .",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Card(
                          color: Colors.green,
                          elevation: 20.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    //aligner les fleches retour et avant vers le bas
                    Container(
                      height: 250,
                      child: Align(
                        widthFactor: double.infinity,
                        heightFactor: double.infinity,
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[Icon(Icons.arrow_forward)],
                        ),
                      ),
                    )
                  ],
                )),
            //page 2
            Container(
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 200,
                      child: Image.asset('assets/images/logohagri.png'),
                    ),

                    Card(
                      margin: EdgeInsets.only(bottom: 30.0, top: 10.0),
                      elevation: 10.0,
                      shadowColor: Colors.black,
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Drones et capteurs',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.50,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(bottom: 10.0, top: 15.0),
                      elevation: 10.0,
                      shadowColor: Colors.black,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            "Un drone et des capteurs à votre disposition pour faciliter toutes vos décisions.",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),

                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Card(
                          color: Colors.green,
                          elevation: 20.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    //aligner les fleches retour et avant vers le bas
                    Container(
                      height: 200,
                      child: Align(
                        widthFactor: double.infinity,
                        heightFactor: double.infinity,
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.arrow_back),
                            Icon(Icons.arrow_forward)
                          ],
                        ),
                      ),
                    )
                  ],
                )),

            //page 3
            Container(
                padding: EdgeInsets.all(20),
                color: Colors.green,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 300,
                      height: 150,
                      child: Image.asset('assets/images/logohagri.png'),
                    ),
                    Card(
                      margin: EdgeInsets.only(bottom: 30.0, top: 10.0),
                      elevation: 10.0,
                      shadowColor: Colors.black,
                      color: Colors.green,
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Text('Bienvenue sur High Agri',
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.50,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(bottom: 10.0, top: 15.0),
                      elevation: 10.0,
                      shadowColor: Colors.black,
                      color: Colors.green,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                            "Consulter les valeurs de température, pH, pka et d’humidité de vos champs.",
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            )),
                      ),
                    ),

                    TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Card(
                          color: Colors.green,
                          elevation: 20.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Skip',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )),
                    //aligner les fleches retour et avant vers le bas
                    Container(
                      height: 250,
                      child: Align(
                        widthFactor: double.infinity,
                        heightFactor: double.infinity,
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.arrow_back),
                            TextButton(
                                onPressed: () {
                                  //redirection vers la page signup ppour créer un compte
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SplashPage()));
                                },
                                child: Card(
                                  color: Colors.green,
                                  elevation: 20.0,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Créer Compte',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
