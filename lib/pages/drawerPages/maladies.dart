import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:ha2/pages/drawerPages/details_maladies.dart';

List data = [
  {
    "albumId": 1,
    "id": 1,
    "title": "Gloeosporioses",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952",
    "group": "Fruits",
    "date": "20/04/2021",
    "auteur": "Wikipédia",
    "description":
        "|Une contamination précoce Les maladies des taches lenticellaires, communément appelées « gloeosporioses », sont d'importantes maladies de conservation des fruits à pépins.L’infection a lieu au verger, essentiellement au cours du dernier mois qui précède la récolte, pendant les périodes de pluie. Mais des contaminations précoces peuvent aussi se produire à partir de 60 jours avant la récolte.",
    "image": "assets/maladies/pommes.jpg",
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Botrytis",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796",
    "group": "Fruits",
    "date": "20/04/2021",
    "auteur": "High Agri",
    "description":
        "  Botrytis est un important champignon parasite de la poire, mais il s’attaque aussi aux pommes.Parasite de blessure, comme penicilium, il contamine les fruits au verger et en station fruitière. Le développement de la pourriture est rapide. Le champignon est susceptible de se transmettrepar contact avec des fruits sains, via les lenticelles, où se forment alors des points de pourriture.",
    "image": "assets/maladies/fraises.jpg",
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "Phytophthora",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355",
    "group": "Plantes",
    "date": "20/04/2021",
    "auteur": "High Agri",
    "description":
        "Une pourriture qui se développe pendant le stockageLorsque Phytophthora est présent dans le verger sous la forme de chancres du collet, il peut contaminer les fruits avant la récolte s’ils sont proches du sol. La pourriture, ferme et lenticellaire,se développe après 2 ou 3 mois de stockage. Il peut aussi contaminer directement les fruits par projection de terre dans les pallox lors de la récolte.La maladie peut être freinée par les températures basses.",
    "image": "assets/maladies/phytophthora.jpg",
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "Cloque du pêcher ",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776",
    "group": "Plantes",
    "date": "20/04/2021",
    "auteur": "Basf.fr ",
    "description":
        "La cloque du pêcher est une maladie importante provoquée par Taphrina deformans. Le champignon attaque les différentes parties aériennes de l’arbre en cours de croissance avec des dégâts indirects souvent très graves. Les feuilles sont boursouflées, la photosynthèse est réduite et l’arbre affaibli, ayant des conséquences sur la production.",
    "image": "assets/maladies/cloque_pecher.jpg",
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "Mildiou Gris du Coton ",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97",
    "group": "Coton",
    "date": "20/04/2021",
    "auteur": "Plantix.net",
    "description":
        "Par temps très humide, les deux côtés de la feuille se recouvrent d'une croissance fongique blanc argenté. Les feuilles sévèrement affectées deviennent nécrotiques, s'enroulent et se dessèchent, prenant une couleur brun rouge et tombant prématurément. La défoliation affaiblit le plant et sa productivité.",
    "image": "assets/maladies/coton1.jpg",
  },
  {
    "albumId": 1,
    "id": 6,
    "title": "Gale bactérienne de la tomate ",
    "url": "https://via.placeholder.com/600/56a8c2",
    "thumbnailUrl": "https://via.placeholder.com/150/56a8c2",
    "group": "Tomates",
    "date": "20/04/2021",
    "auteur": "Platix.net",
    "description":
        "Les Xanthomonas spp. responsables de la gale bactérienne sont particulièrement dommageables sur tomate et plus encore sur poivron. Cette maladie sévit sur tous les continents, quasiment partout où la tomate est cultivée",
    "image": "assets/maladies/tomate1.jpg",
  },
  {
    "albumId": 1,
    "id": 7,
    "title": "Oïdium",
    "url": "https://via.placeholder.com/600/b0f7cc",
    "thumbnailUrl": "https://via.placeholder.com/150/b0f7cc",
    "group": "Tomates",
    "date": "20/04/2021",
    "auteur": " Wikipedia",
    "description":
        "est un champignon qui attaque de nombreuses plantes. Les plantes touchées sont facilement reconnaissables par leurs feuilles recouvertes d'une poudre blanche. Les tiges et les fleurs peuvent être également touchées. Les feuilles des plantes colonisées se recroquevillent, se dessèchent et tombent.",
    "image": "assets/analyse/tomato.jpg",
  },
  {
    "albumId": 1,
    "id": 8,
    "title": "Anthracnose",
    "url": "https://via.placeholder.com/600/54176f",
    "thumbnailUrl": "https://via.placeholder.com/150/54176f",
    "group": "Plantes",
    "date": "20/04/2021",
    "auteur": "High Agri",
    "description":
        "L'anthracnose est une maladie cryptogamique qui se développe lorsque l'humidité se fait trop importante, notamment au printemps et à l'automne, mais également en été avec les orages estivaux particulièrement propices au développement de cette maladie qui a besoin d'une humidité forte et de chaleur (autour de 20°C)",
    "image": "assets/maladies/anthracnose-erable.jpg",
  },
  {
    "albumId": 1,
    "id": 10,
    "title": "Monilia fructigena ",
    "url": "https://via.placeholder.com/600/810b14",
    "thumbnailUrl": "https://via.placeholder.com/150/810b14",
    "group": "Suplémentaires",
    "date": "20/04/2021",
    "auteur": "Gunten Brother",
    "description": "",
    "image": "assets/maladies/monilia-fructigena.jpg",
  },
  {
    "albumId": 1,
    "id": 11,
    "title": "Moniliose du prunier",
    "url": "https://via.placeholder.com/600/1ee8a4",
    "thumbnailUrl": "https://via.placeholder.com/150/1ee8a4",
    "group": "Suplémentaires",
    "date": "20/04/2021",
    "auteur": "Wikipedia",
    "description":
        "La moniliose du prunier est une maladie due à 2 champignons Monilia, ils s'attaquent aux fleurs puis aux fruits. Ils hivernent dans les fruits momifiés restés sur l'arbre ou tombés au sol. ... 2 champignons sont responsables de cette maladie sur les pruniers : Monilia laxa et Monilia fructigena.",
    "image": "assets/maladies/fraises2.jpg",
  },
  {
    "albumId": 1,
    "id": 12,
    "title": "Montaison",
    "url": "https://via.placeholder.com/600/66b7d2",
    "thumbnailUrl": "https://via.placeholder.com/150/66b7d2",
    "group": "Suplémentaires",
    "date": "20/04/2021",
    "auteur": "Greenastic.com",
    "description":
        "Principales plantes touchées : légumes description : les plantes fleurissent et montent en graines trop rapidement Cause : Température trop élevée pour la saison ou une forte sécheresse. Le non respect des dates de semis et de mauvais arrosages peuvent en être aussi la cause. Solution : arroser régulièrement et vérifier les dates de semis",
    "image": "assets/maladies/montaison.jpg",
  },
  {
    "albumId": 1,
    "id": 13,
    "title": "NÉCROSE APICALE",
    "url": "https://via.placeholder.com/600/197d29",
    "thumbnailUrl": "https://via.placeholder.com/150/197d29",
    "group": "Suplémentaires",
    "date": "20/04/2021",
    "auteur": "Agri Tech",
    "description":
        "Principales plantes touchées : tomates –Description : tâche noire au sommet des légumes/fruits Cause : Maladie causée par une mauvaise assimilation du calcium due à des différences d’humidité du sol Solution : Arrosez plus régulièrement et vérifiez l’humidité de la terre pour qu’elle reste contante. En préventif , apportez du compost à votre terre pour l’enrichir.",
    "image": "assets/maladies/necrose_apicale-1.jpg",
  },
  {
    "albumId": 1,
    "id": 20,
    "title": "Moniliose",
    "url": "https://via.placeholder.com/600/8985dc",
    "thumbnailUrl": "https://via.placeholder.com/150/8985dc",
    "group": "Fruits",
    "date": "20/04/2021",
    "auteur": "Wikipedia",
    "description":
        "La moniliose ou pourriture des fruits est un champignon ravageur des arbres fruitiers qui peut avoir de graves effets sur la récolte. Il attaque les fruits qui finissent par pourrir. On parle également de pourriture des fruits.",
    "image": "assets/maladies/Monilia_sp._on_apple.jpg",
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
  _GroupListViewState createState() => _GroupListViewState();
}

class _GroupListViewState extends State<GroupListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Les maladies"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: GroupedListView<dynamic, String>(
        elements: data,
        groupBy: (element) => element['group'],
        groupSeparatorBuilder: (String groupByValue) => Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Flexible(
                  child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      groupByValue,
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
        itemBuilder: (context, dynamic element) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsMaladies(
                    auteur: element['auteur'],
                    date: element['date'],
                    description: element['description'],
                    groupe: element['group'],
                    id: element['id'],
                    imagePath: element['image'],
                    title: element['title'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 10,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: ClipRRect(
                      child: Image(
                        image: AssetImage(element[
                            'image']), //NetworkImage(element['thumbnailUrl']),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    )),
                    Expanded(
                        flex: 5,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Text(
                                  element['title'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.account_circle_sharp,
                                        color: Colors.grey, size: 16),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('${element['auteur']}'),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 5),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.calendar_today,
                                        color: Colors.grey, size: 16),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      child: Text('${element['date']}'),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
        itemComparator: (item1, item2) =>
            item1['title'].compareTo(item2['title']), // optional
        useStickyGroupSeparators: true, // optional
        floatingHeader: true, // optional
        order: GroupedListOrder.ASC, // optional
      ),
    );
  }
}
