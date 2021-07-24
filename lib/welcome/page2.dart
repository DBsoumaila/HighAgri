import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageDeux extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
           title: Text("Bienvenue"),
          actions: [
          
    
        
         Image.asset('assets/images/logohagri.png'),
        
        
        ],),
      
        body: Center(
     child: PageDeuxOutils(),
      ),
      );
}
class PageDeuxOutils extends StatefulWidget {
  @override
  _PageDeuxOutilsState createState() => _PageDeuxOutilsState();

  
}  
class _PageDeuxOutilsState extends State<PageDeuxOutils>{

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
      child:Text('Page 2')
     )
   );
  }
}
