import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ha2/welcome/page1.dart';
import 'package:ha2/widget/navigation_drawer_widget.dart';


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
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        // endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(Dashboard.title),
              actions: [
        
         Image.asset('assets/images/logohagri.png'),
        
        
      ],   ),
        body: Center(
        child: Center(
          child:Text("Dashboard") ,),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.red[600],
        child: Icon(Icons.photo_camera),
      ),
      );
}