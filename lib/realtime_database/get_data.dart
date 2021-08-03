// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyHomePageAll extends StatefulWidget {
  const MyHomePageAll({Key? key, required this.app}) : super(key: key);

  final FirebaseApp app;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageAll> {
  int _counter = 0;
  //references de bases de données
  late DatabaseReference _counterRef;
  late DatabaseReference _messagesRef;

  //air_humidite
  late DatabaseReference _airHumiditeRef;
  //air_temperature
  late DatabaseReference _airTemperaureRef;

  //irrigation
  late DatabaseReference _irrigationRef;
  //Nitrogene value
  late DatabaseReference _nitrogeneValueRef;
  //phosphore
  late DatabaseReference _phosphorousValueRef;
  //potassium
  late DatabaseReference _potassiumValueRef;
  //ph du sol
  late DatabaseReference _pHRef;
  //humidite du sol
  late DatabaseReference _humiditeSolRef;

  late StreamSubscription<Event> _counterSubscription;
  late StreamSubscription<Event> _messagesSubscription;

  //mise en plqce des streams de donnees
  late StreamSubscription<Event> _airHumiditeSubscription;
  late StreamSubscription<Event> _humiditeSolSubscription;
  late StreamSubscription<Event> _pHSubscription;
  late StreamSubscription<Event> _phosphorousValueSubscription;
  late StreamSubscription<Event> _nitrogeneValueSubscription;
  late StreamSubscription<Event> _irrigationSubscription;
  late StreamSubscription<Event> _airTemperaureSubscription;

  bool _anchorToBottom = false;

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
    // Demonstrates configuring to the database using a file
    _counterRef = FirebaseDatabase.instance.reference().child('counter');

    // Demonstrates configuring the database directly
    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);
    //la base sOUMAILA
    _messagesRef = database.reference().child('soumaila');
    //la base air_humidite
    _airHumiditeRef = database.reference().child('air_humidity');

    database.reference().child('counter').get().then((DataSnapshot? snapshot) {
      print(
          'Connected to directly configured database and read ${snapshot!.value}');
    });
    database.setPersistenceEnabled(true);
    database.setPersistenceCacheSizeBytes(10000000);
    _counterRef.keepSynced(true);
    _counterSubscription = _counterRef.onValue.listen((Event event) {
      setState(() {
        _error = null;
        _counter = event.snapshot.value ?? 0;
      });
    }, onError: (Object o) {
      final DatabaseError error = o as DatabaseError;
      setState(() {
        _error = error;
      });
    });
    _messagesSubscription =
        _messagesRef.limitToLast(10).onChildAdded.listen((Event event) {
      print('Child added: ${event.snapshot.value}');
    }, onError: (Object o) {
      final DatabaseError error = o as DatabaseError;
      print('Error: ${error.code} ${error.message}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    _messagesSubscription.cancel();
    _counterSubscription.cancel();
  }

  Future<void> _increment() async {
    await _counterRef.set(ServerValue.increment(1));

    await _messagesRef
        .push()
        .set(<String, String>{_kTestKey: '$_kTestValue $_counter'});
  }

  Future<void> _incrementAsTransaction() async {
    // Increment counter in transaction.
    final TransactionResult transactionResult =
        await _counterRef.runTransaction((MutableData mutableData) async {
      mutableData.value = (mutableData.value ?? 0) + 1;
      return mutableData;
    });

    if (transactionResult.committed) {
      await _messagesRef.push().set(<String, String>{
        _kTestKey: '$_kTestValue ${transactionResult.dataSnapshot?.value}'
      });
    } else {
      print('Transaction not committed.');
      if (transactionResult.error != null) {
        print(transactionResult.error!.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Real Time database'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: Center(
              child: _error == null
                  ? Text(
                      'Click de bouton $_counter foi${_counter == 1 ? '' : 's'}.\n\n'
                      'Tous les ttypes de telephone',
                    )
                  : Text(
                      'Error retrieving button tap count:\n${_error!.message}',
                    ),
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await _incrementAsTransaction();
              },
              child: const Text('Ajouter')),
          ListTile(
            leading: Checkbox(
              onChanged: (bool? value) {
                if (value != null) {
                  setState(() {
                    _anchorToBottom = value;
                  });
                }
              },
              value: _anchorToBottom,
            ),
            title: const Text('Hauh vers le bas'),
          ),
          Flexible(
            child: FirebaseAnimatedList(
              key: ValueKey<bool>(_anchorToBottom),
              query: _airHumiditeRef,
              reverse: _anchorToBottom,
              itemBuilder: (BuildContext context, DataSnapshot snapshot,
                  Animation<double> animation, int index) {
                return SizeTransition(
                  sizeFactor: animation,
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () =>
                          _airHumiditeRef.child(snapshot.key!).remove(),
                      icon: const Icon(Icons.delete),
                    ),
                    title: Text(
                      '$index: ${snapshot.value.toString()}',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
