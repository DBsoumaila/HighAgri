import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';

List data=[
  {
    "albumId": 1,
    "id": 1,
    "title": "Maladie x",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952",
    "group": "Fruits",
    "date": "20/04/2021",
    "auteur": "Marc Tonton"

  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Lamig",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796",
    "group": "Plantes",
    "date": "20/04/2021",
    "auteur": "Marc Tonton"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "Mal seul",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355",
    "group": "Fruits",
    "date": "20/04/2021",
    "auteur": "Tot Mom"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "culpa odio ",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776",
      "group": "Plantes",
    "date": "20/04/2021",
    "auteur": "Francois "
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "natus nisi ",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97",
    "group": "Bois",
    "date": "20/04/2021",
    "auteur": "Paul"
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "accusamus ea ",
    "url": "https://via.placeholder.com/600/56a8c2",
    "thumbnailUrl": "https://via.placeholder.com/150/56a8c2",
    "group": "Bois",
    "date": "20/04/2021",
    "auteur": "Kofi"
  },
  {
    "albumId": 1,
    "id": 7,
    "title": "officia delectus consequatur vero aut veniam explicabo molestias",
    "url": "https://via.placeholder.com/600/b0f7cc",
    "thumbnailUrl": "https://via.placeholder.com/150/b0f7cc",
      "group": "Bois",
    "date": "20/04/2021",
    "auteur": " Vibes"
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "aut porro officiis laborum odit ea laudantium corporis",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f",
      "group": "Plantes",
    "date": "20/04/2021",
    "auteur": "Money"
  },
  {
    "albumId": 1,
    "id": 9,
    "title": "qui eius qui autem sed",
    "url": "https://via.placeholder.com/600/51aa97",
    "thumbnailUrl": "https://via.placeholder.com/150/51aa97",
    "group": "Plantes",
    "date": "20/04/2021",
    "auteur": "Hits Gotz"
  },
  {
    "albumId": 1,
    "id": 10,
    "title": "beatae et provident et ut vel",
    "url": "https://via.placeholder.com/600/810b14",
    "thumbnailUrl": "https://via.placeholder.com/150/810b14",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Gunten Brother"
  },
  {
    "albumId": 1,
    "id": 11,
    "title": "nihil at amet non hic quia qui",
    "url": "https://via.placeholder.com/600/1ee8a4",
    "thumbnailUrl": "https://via.placeholder.com/150/1ee8a4",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Soumaila"
  },
  {
    "albumId": 1,
    "id": 12,
    "title": "mollitia soluta ut rerum eos aliquam consequatur perspiciatis maiores",
    "url": "https://via.placeholder.com/600/66b7d2",
    "thumbnailUrl": "https://via.placeholder.com/150/66b7d2",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Soumaila"
  },
  {
    "albumId": 1,
    "id": 13,
    "title": "repudiandae iusto deleniti rerum",
    "url": "https://via.placeholder.com/600/197d29",
    "thumbnailUrl": "https://via.placeholder.com/150/197d29",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Dabanguibe"
  },
  {
    "albumId": 1,
    "id": 14,
    "title": "est necessitatibus architecto ut laborum",
    "url": "https://via.placeholder.com/600/61a65",
    "thumbnailUrl": "https://via.placeholder.com/150/61a65",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Halim"
  },
  {
    "albumId": 1,
    "id": 15,
    "title": "harum dicta similique quis dolore earum ex qui",
    "url": "https://via.placeholder.com/600/f9cee5",
    "thumbnailUrl": "https://via.placeholder.com/150/f9cee5",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Persona"
  },
  {
    "albumId": 1,
    "id": 16,
    "title": "iusto sunt nobis quasi veritatis quas expedita voluptatum deserunt",
    "url": "https://via.placeholder.com/600/fdf73e",
    "thumbnailUrl": "https://via.placeholder.com/150/fdf73e",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Shiva"
  },
  {
    "albumId": 1,
    "id": 17,
    "title": "natus doloribus necessitatibus ipsa",
    "url": "https://via.placeholder.com/600/9c184f",
    "thumbnailUrl": "https://via.placeholder.com/150/9c184f",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Nova"
  },
  {
    "albumId": 1,
    "id": 18,
    "title": "laboriosam odit nam necessitatibus et illum dolores reiciendis",
    "url": "https://via.placeholder.com/600/1fe46f",
    "thumbnailUrl": "https://via.placeholder.com/150/1fe46f",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Moribo"
  },
  {
    "albumId": 1,
    "id": 19,
    "title": "perferendis nesciunt eveniet et optio a",
    "url": "https://via.placeholder.com/600/56acb2",
    "thumbnailUrl": "https://via.placeholder.com/150/56acb2",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Infinit z"
  },
  {
    "albumId": 1,
    "id": 20,
    "title": "assumenda voluptatem laboriosam enim consequatur veniam placeat reiciendis error",
    "url": "https://via.placeholder.com/600/8985dc",
    "thumbnailUrl": "https://via.placeholder.com/150/8985dc",
    "group": "tonton",
    "date": "20/04/2021",
    "auteur": "Tired 7"
  },

];

class MaladiesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
      
        body: Center(
     child: GroupListView(),
      ),
      );
}
class GroupListView extends StatefulWidget {
  @override
  _GroupListViewState createState() =>_GroupListViewState();
  
}  
class _GroupListViewState extends State<GroupListView>{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: Text("Les maladies"),
      centerTitle: true,
          backgroundColor: Colors.green,
     
     ),
     body: GroupedListView<dynamic, String>(
    elements: data,
    groupBy: (element) => element['group'] ,
    groupSeparatorBuilder: (String groupByValue) => Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: Row(children: [
              Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                child: Text(groupByValue,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
              )
            ],)
         )
        ],),
    ),
    itemBuilder: (context, dynamic element){
      return Card(
        elevation: 10,
        margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  child: Image(
                    image: NetworkImage(element['thumbnailUrl']),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  )
                  ),
                  Expanded(
                    flex: 5,
                    child: 
                    Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 10,right: 10),
                              child: Text(
                                element['title'],
                                style: TextStyle(
                                  fontSize: 16,fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                              ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: 
                                  [Icon(Icons.account_circle_sharp,color: Colors.grey,size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                     '${element['auteur']}'
                                    ),
                                  )

                                  ],),
                                ),
                                    Padding(
                                padding: EdgeInsets.only(left: 10,right: 10,top: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: 
                                  [Icon(Icons.calendar_today,color: Colors.grey,size: 16),
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                     '${element['date']}'
                                    ),
                                  )

                                  ],),
                                )




                          ],),
                    )
                    )
            ],

        ),
        ),
      );
    },
    itemComparator: (item1, item2) => item1['title'].compareTo(item2['title'] ), // optional
    useStickyGroupSeparators: true, // optional
    floatingHeader: true, // optional
    order: GroupedListOrder.ASC, // optional
  ),
   );
  }
  
}