import 'package:flutter/material.dart';

class Team extends StatelessWidget {
  final String imagePath;
  final String title;
  final String photographer;
  final String price;
  final String details;
  final int index;
  Team(
      {required this.imagePath,
      required this.title,
      required this.photographer,
      required this.price,
      required this.details,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo$index',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            photographer,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            color: Colors.lightGreen,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          details,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.green,
                          child: Text(
                            'Retour',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(50)),
                          onPressed: () {},
                          padding: EdgeInsets.symmetric(vertical: 15),
                          color: Colors.green,
                          child: Text(
                            'Partager',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
