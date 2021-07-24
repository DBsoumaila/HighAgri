import 'dart:convert';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ha2/widget/profil_pic_widget.dart';

class ProfilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Profil'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body:Container(

          child: StaggeredGridView.count(
             crossAxisCount: 4,
           crossAxisSpacing: 9.0,
          mainAxisSpacing: 9.0,
            children:[
          Column(
              
              children: [
                profilPic(),
                SizedBox(
                  height: 20,

                  ),
                  //Element mon compte
                ProfilElements(icon: Icons.person_outline,text:'Mon compte' ,onpress: (){},),
                  //Element mon compte
                ProfilElements(icon:Icons.g_translate_outlined,text:'Langue' ,onpress: (){},),
                //Element mon compte
                ProfilElements(icon: Icons.dark_mode_outlined,text:'Themes' ,onpress: (){},),
                //Element mon compte
                ProfilElements(icon: Icons.image_outlined,text:'Mes Captures' ,onpress: (){},),
                //Element mon compte
                ProfilElements(icon: Icons.stars_outlined,text:'Favoris' ,onpress: (){},),
                //Element mon compte
                ProfilElements(icon: Icons.contacts_outlined,text:'Mes Contacts' ,onpress: (){},),




              ],
              ),
            ],
             staggeredTiles: [
          //on fait scroller tout le Row jusqu'à 800pixels
          StaggeredTile.extent(4, 800.0),
         
        ],
  
          ),
        )
      );
}

class ProfilElements extends StatelessWidget {
  const ProfilElements({
    Key? key, 
    required this.text, 
    required this.icon, 
    required this.onpress,
  }) : super(key: key);
  
  //définition des paramètrees à utiliser pour les autres elements
  final String text;
  final IconData icon;
  final VoidCallback onpress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      
      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      child: FlatButton(
        color: Colors.grey,
        padding: EdgeInsets.all(20.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: onpress,
         child:Row(
           
           children: [
             Icon(icon, color: Colors.black,
             
             ),
             SizedBox(
               width:22
             ),
             //etendre tout le text au milieu
             Expanded(
               child: 
               Text(
                 text,
                 style: TextStyle(
                   color: Colors.white,
                   fontWeight: FontWeight.bold,
                   fontSize: 20
                   ),
               ),
               ),
               //placer l'con à la fin à droite donc
               Icon(Icons.arrow_forward)

           ],)
            ),
    );
  }
}