import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/models/imageModel.dart';
import 'package:ha2/pages/gallery/imageDetail.dart';
import 'package:ha2/pages/propos/team.dart';

class AboutUs extends StatelessWidget {
  List<ImageDetails> _images = [
    ImageDetails(
      imagePath: 'assets/squad/aya2.JPG',
      price: 'description',
      photographer: 'data ingenieur',
      title: 'BENTALEB Aya',
      details:
          'Data Engeneer chez High Agri, elle nous met en place des modèles performants avec son co-équipié Mr Aymane.',
    ),
    ImageDetails(
      imagePath: 'assets/squad/aymane_pic_dat.jpg',
      price: 'description',
      photographer: 'Data Engeneer',
      title: 'HMIDICH Aymane',
      details:
          ' L\'un de nos data engeneer. Il est chargeé de du déploiement des modèles de High Agri afin de faire d es prédictions sur des plantes.',
    ),
    ImageDetails(
      imagePath: 'assets/squad/hanane.png',
      price: 'description',
      photographer: ' Data Engeneer',
      title: 'DAHI Hanane',
      details:
          'Data Engeneer chez High Agri. Travaille sur l\'irrigation et l\'automation de drone.',
    ),
    ImageDetails(
      imagePath: 'assets/squad/y.png',
      price: 'description',
      photographer: 'Embebed Systems Engeneer',
      title: 'L. Youssef',
      details:
          'Il s\'occupe de tout ce qui est systèmes embarqués chez High Agri. Conception de drones, et mise en place de systèmes d\'irrigation',
    ),
    ImageDetails(
      imagePath: 'assets/squad/nour.png',
      price: 'Description',
      photographer: 'Directrice Marketing',
      title: 'BENRIALA Nour',
      details:
          'La directrice Marketing de High Agri. Elle s\'occupe de faire connaitre notre entreprise et nos solutions. C\'est la vitrine de notre entreprise à l\'extérieur.',
    ),
    ImageDetails(
      imagePath: 'assets/squad/soumaila_final.jpg',
      price: 'description',
      photographer: 'Software Ingeneer',
      title: 'DABANGUIBE Soumaïla ',
      details:
          ' Le développeur de la startup High Agri. Développeur full stack web, mobile et deseigner à ses temps perdus.',
    ),
  ];

  Material myTextItems(String title, String subtitle, IconData icon) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.circular(24.0),
      shadowColor: Color(0x802196F3),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Text(
                        title,
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        subtitle,
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Material HighDescription(String description) {
    return Material(
      color: Colors.white,
      elevation: 14.0,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20.0),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)),
      shadowColor: Color(0x802196F3),
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Center(
          child: Text(
            description,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('A propos '),
      ),
      backgroundColor: Colors.green,
      body: Container(
        child: StaggeredGridView.count(
          crossAxisCount: 1,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                Text(
                  'A propos',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: myTextItems('High Agri', 'La startup en feu',
                            Icons.local_fire_department_outlined),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: HighDescription(
                      'Bonjour cher client, votre geande Entreprise High Agri est la pour vous faciliter la tache   High Agri est la pour vous faciliter la tache  High Agri est la pour vous faciliter la tache  High Agri est la pour vous faciliter la tache '),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: myTextItems(
                        "Squad", 'High Agri', Icons.groups_outlined),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Team(
                                  imagePath: _images[index].imagePath,
                                  title: _images[index].title,
                                  photographer: _images[index].photographer,
                                  price: _images[index].price,
                                  details: _images[index].details,
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: 'logo$index',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: AssetImage(_images[index].imagePath),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: _images.length,
                    ),
                  ),
                ),
              ],
            ),
          ],
          staggeredTiles: [
            StaggeredTile.extent(1, 1000.0),
          ],
        ),
      ),
    );
  }
}
