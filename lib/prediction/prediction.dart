import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ha2/http/services/http_service.dart';

class Predictions extends StatefulWidget {
  const Predictions({Key? key}) : super(key: key);

  @override
  _PredictionsState createState() => _PredictionsState();
}

class _PredictionsState extends State<Predictions> {
  late String prediction = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPrediction();
  }

  // recupération de la prédiction
  getPrediction() async {
    // recuperation simple
    try {
      var responset = await Dio().get("https://highagriv6.herokuapp.com");

      print(responset.data.toString());
      setState(() {
        prediction = responset.data.toString();
      });

      // recuperation get avec des   PARAMETERS
      // var responseParameters = await Dio()
      //     .get('/test', queryParameters: {'id': 12, 'name': 'wendu'});
      // print(responseParameters.data.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prédictions '),
        actions: [
          Image.asset('assets/images/logohagri.png'),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20.0,
            ),
            Icon(
              Icons.batch_prediction_outlined,
              size: 60.0,
              color: Colors.green,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  'Ce qu\'il faut planter selon votre sol',
                  style: TextStyle(color: Colors.cyan, fontSize: 20.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(''),
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              height: 200.0,
              width: double.infinity,
              child: Card(
                elevation: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Résultat de prédiction',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      prediction.toString(),
                      style: TextStyle(color: Colors.green, fontSize: 30.0),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {},
                  child: Container(
                    width: double.infinity,
                    child: Center(
                      child: Text(''),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
