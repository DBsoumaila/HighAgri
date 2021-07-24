import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageTrois extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
           title: Text("Bienvenue"),
          actions: [
          
    
        
         Image.asset('assets/images/logohagri.png'),
        
        
        ],),
      
        body: Center(
     child: Page3Outils(),
      ),
      );
}
class Page3Outils extends StatefulWidget {
  @override
  _Page3OutilsState createState() => _Page3OutilsState();

  
}  
class _Page3OutilsState extends State<Page3Outils>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
      child:Text('Page 3')
     )
   );
  }
}
