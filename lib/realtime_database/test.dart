import 'package:flutter/material.dart';

import 'package:ha2/models/ph.dart';
import 'package:ha2/realtime_database/services_realtime.dart';

class Needs extends StatefulWidget {
  static final String id = 'needs_screen';

  @override
  _NeedsState createState() => _NeedsState();
}

class _NeedsState extends State<Needs> {
  double _ph = 0.0;

  @override
  void initState() {
    super.initState();
    _setupNeeds();
  }

  _setupNeeds() async {
    double needs = RealTimeDatabaseService().getPh();
    setState(() {
      _ph = needs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(_ph.toString()));
  }
}
