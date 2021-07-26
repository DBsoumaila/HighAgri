import 'package:flutter/material.dart';
import 'package:ha2/models/imageModel.dart';
import 'package:ha2/pages/gallery/imageDetail.dart';

class GalleryPage extends StatelessWidget {
  List<ImageDetails> _images = [
    ImageDetails(
      imagePath: 'assets/gallery/1.jpg',
      price: 'description',
      photographer: 'Martin Andres',
      title: 'New Year',
      details:
          'This image was taken during a party in New York on new years eve. Quite a colorful shot.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/2.jpg',
      price: 'description',
      photographer: 'Abraham Costa',
      title: 'Spring',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/3.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'Casual Look',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/4.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/5.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/6.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/7.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/8.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/9.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/10.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/11.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/12.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/13.jpg',
      price: 'description',
      photographer: 'Jamie Bryan',
      title: 'New York',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/14.jpg',
      price: 'description',
      photographer: 'Matthew',
      title: 'Cone Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/15.jpg',
      price: 'description',
      photographer: 'Martin Sawyer',
      title: 'Pink Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/16.jpg',
      price: 'description',
      photographer: 'John Doe',
      title: 'Strawberry Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/20.jpg',
      price: 'description',
      photographer: ' X',
      title: 'Strawberry Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/17.jpg',
      price: 'description',
      photographer: 'Pplaner',
      title: 'Strawberry Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/18.jpg',
      price: 'description',
      photographer: 'Mtyhg',
      title: 'Strawberry Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/19.jpg',
      price: 'description',
      photographer: 'Xin Tyo',
      title: 'Strawberry Ice Cream',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
    ImageDetails(
      imagePath: 'assets/gallery/21.jpg',
      price: 'description',
      photographer: 'Photographe X',
      title: 'Maladie de 784',
      details:
          'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nihil error aspernatur, sequi inventore eligendi vitae dolorem animi suscipit. Nobis, cumque.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Gallery',
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
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
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
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        child: Icon(Icons.photo_camera),
      ),
    );
  }
}
