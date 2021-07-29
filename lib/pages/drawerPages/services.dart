import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      //drawer: NavigationDrawerWidget(),
      appBar: AppBar(
        title: Text('Services'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Container(
            margin: EdgeInsets.all(5.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Analysez  vos images pour détecter si vos plantes sont malades',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
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
                            child: Center(
                              child: Text(
                                'Selectionnez une image',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //les actions a mener sur une image
                          TextButton(
                            onPressed: () {},
                            child: Icon(Icons.delete_outline),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.history_outlined),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Icon(Icons.security_outlined),
                          ),
                        ],
                      ),
                      Container(
                        height: 200.0,
                        width: double.infinity,
                        child: Card(
                          elevation: 7.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Résultats d'analyse"),
                          ),
                        ),
                      )
                    ])),
              ],
            )),
      ));
}
