import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/pages/charts/phChart.dart';
import 'package:ha2/widget/navigation_drawer_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:charts_flutter/flutter.dart' as charts;






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
  final List _screens=[
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  int  _currentIndex=0;
  

  // données
   List<Ph> dataPh = [
    Ph("2021",13,charts.ColorUtil.fromDartColor(Colors.blue)),
     Ph("2022",10,charts.ColorUtil.fromDartColor(Colors.green)),
      Ph("2023",20,charts.ColorUtil.fromDartColor(Colors.yellow)),
       Ph("2024",5,charts.ColorUtil.fromDartColor(Colors.pink)),
        Ph("2025",17,charts.ColorUtil.fromDartColor(Colors.black)),
         Ph("2026",19,charts.ColorUtil.fromDartColor(Colors.green)),
          Ph("2027",26,charts.ColorUtil.fromDartColor(Colors.blue)),
    
  ];

  
   var data = [0.0, 1.0, 1.5, 2.0, 0.0, 0.0, -0.5, -1.0, -0.5, 0.0, 0.0];
  var data1 = [0.0,-2.0,3.5,-2.0,0.5,0.7,0.8,1.0,2.0,3.0,3.2];

  
  Material myTextItems(String title, String subtitle){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
               children: <Widget>[

                  Padding(
                   padding: EdgeInsets.all(2.0),
                      child:Text(title,style:TextStyle(
                        fontSize: 14.0,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold
                      ),),
                    ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle,style:TextStyle(
                      fontSize: 15.0,
                    ),),
                  ),

               ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  Material myCircularItems(String title, String subtitle){
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child:Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(title,style:TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child:Text(subtitle,style:TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),

                  Padding(
                    padding:EdgeInsets.all(8.0),
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


  Material mychart1Items(String title, String priceVal,String subtitle) {
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
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text('Hi Its')
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
                    child: Text(nom, style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold
                    ),),
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children:<Widget>[
                         Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(formatDatTime(date), style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold

                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(hourTime(date), style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.blueGrey,
                    ),),
                  ),

                  ]
              

                ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


String formatDatTime(DateTime dateTime)
{
  return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
}
String hourTime(DateTime dateTime)
{
  return '${dateTime.hour} H:${dateTime.minute} m:${dateTime.second} s';
}


  Material mychart2Items(String title, String priceVal,String subtitle) {
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
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(priceVal, style: TextStyle(
                      fontSize: 30.0,
                    ),),
                  ),
                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Text(subtitle, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueGrey,
                    ),),
                  ),

                  Padding(
                    padding: EdgeInsets.all(1.0),
                    child: Container(
                      child: Text('Autres'),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
                    child: Text(title, style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.blueAccent,
                    ),),
                  ),
                  PhChart(data: dataPh,titre: title,),
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
          color:Color(0xffE5E5E5),
          child:StaggeredGridView.count(
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
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("Hum.","90"),
          ),
            Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("pH","89"),
          ),
               Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("pKa","4"),
          ),
            Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: myTextItems("Temp(%C)","48.0"),
          ),
            ],
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: mychart2Items("Indications","+19% de Température","voir conseils"),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chart("Evolution du pH"),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chart("Evolution de T(°C)"),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chart("Evolution du pKa"),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Chart("Evolution de l'Hmd."),
          ),
         

         

         


         


        ],
        staggeredTiles: [
          
          StaggeredTile.extent(4, 90.0),
          StaggeredTile.extent(4, 70),//row 
          StaggeredTile.extent(4, 250.0),
          StaggeredTile.extent(4, 250.0),
          StaggeredTile.extent(4, 250.0),
           StaggeredTile.extent(4, 250.0),
        ],
      ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.green,
        child: Icon(Icons.photo_camera),
      ),
      );
}

}
class Ph {
  Ph(this.year, this.valeur,  this.barColor);
final String year;
  final charts.Color barColor;
  final double valeur;
}