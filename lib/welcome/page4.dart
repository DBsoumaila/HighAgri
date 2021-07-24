import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageQuatre extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
           title: Text("Bienvenue"),
          actions: [
          
    
        
         Image.asset('assets/images/logohagri.png'),
        
        
        ],),
      
        body: Center(
     child: Page4Outils(),
      ),
      );
}
class Page4Outils extends StatefulWidget {
  @override
  _Page4OutilsState createState() => _Page4OutilsState();

  
}  
class _Page4OutilsState extends State<Page4Outils>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
      child:Text('Page 4')
     )
   );
  }
}
