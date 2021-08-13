import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ha2/meteo/home/home_controller.dart';
import 'package:ha2/meteo/weather_controller.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/pages/drawerPages/echanges.dart';
import 'package:ha2/pages/drawerPages/maladies.dart';
import 'package:ha2/pages/drawerPages/parametres.dart';
import 'package:ha2/pages/drawerPages/services/services.dart';
import 'package:ha2/pages/gallery/gallerypage.dart';
import 'package:ha2/pages/params/settings.dart';
import 'package:ha2/pages/propos/apropos.dart';
import 'package:ha2/pages/testPages/people_page.dart';
import 'package:ha2/pages/testPages/user_page.dart';
import 'package:ha2/serviceAnalyse/services/analyse_coton.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'Soumaila dabs';
    final email = 'soum@dabs.com';
    final urlImage =
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80';

    return Drawer(
      child: Material(
        //color: Color.fromRGBO(50, 75, 205, 1),
        color: Colors.green,
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              email: email,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name:
                      'Soumaila db', //on peut mettre directement le nom ici en remplacant par name
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Divider(color: Colors.white70),
                  buildMenuItem(
                    text: 'Gallerie',
                    icon: Icons.collections_outlined,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Maladies',
                    icon: Icons.gpp_maybe_outlined,
                    onClicked: () => selectedItem(context, 1),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Services',
                    icon: Icons.workspaces_outline,
                    onClicked: () => selectedItem(context, 2),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'Echanges',
                    icon: Icons.question_answer_outlined,
                    onClicked: () => selectedItem(context, 3),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: Colors.white70),
                  buildMenuItem(
                    text: 'Météo',
                    icon: Icons.nights_stay_outlined,
                    onClicked: () => selectedItem(context, 4),
                  ),
                  Divider(color: Colors.white70),
                  const SizedBox(height: 20),
                  buildMenuItem(
                    text: 'Paramètres',
                    icon: Icons.settings_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                  buildMenuItem(
                    text: 'A propos',
                    icon: Icons.info_outlined,
                    onClicked: () => selectedItem(context, 6),
                  ),
                  const SizedBox(height: 16),
                  buildMenuItem(
                    text: 'déconnexion',
                    icon: Icons.logout_rounded,
                    onClicked: () => selectedItem(context, 7),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    email,
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Recherche',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Future<void> selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => GalleryPage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => MaladiesPage(),
        ));
        break;
      case 2:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ServicesPage()));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => EchangePage(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AppControl(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Params(),
        ));
        break;
      case 6:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutUs(),
        ));
        break;
      case 7:
        await FirebaseAuth.instance.signOut();
        //vérifier si l'utilisateur est bien rentré
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            //utilisateur deconnecte
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Login(),
            ));
          } else {}
        });

        break;
    }
  }
}
