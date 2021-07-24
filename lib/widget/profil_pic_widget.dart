
  import 'package:flutter/material.dart';

SizedBox profilPic() {
    return SizedBox(
            
            
            height: 100,
            width: 100,
            child: Stack(
              clipBehavior: Clip.none, fit:StackFit.expand,
              children:[
                CircleAvatar(backgroundImage: AssetImage('assets/images/profil_girl.jpg'),),
                Positioned(
                  bottom: 0,
                  right: -10,
                  child:     SizedBox(
                  height: 45,
                  width: 45,
                  child: FlatButton(
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                      side: BorderSide(color: Colors.green)
                      ),
                      
                    color: Colors.white,
                    onPressed: () {  },
                  child: Icon(Icons.camera_alt_outlined)),
                ),
             ),
             ],
              ),
           
          );
  }
