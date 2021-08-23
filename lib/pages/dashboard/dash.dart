import 'package:flutter/material.dart';
import 'package:ha2/pages/dashboard/dashpage.dart';
import 'package:ha2/pages/drawerPages/maladies.dart';
import 'package:ha2/pages/drawerPages/profil.dart';
import 'package:ha2/pages/gallery/gallery.dart';
import 'package:ha2/pages/gallery/gallerypage.dart';
import 'package:ha2/widget/navigation_drawer_widget.dart';

class DashboardPageControl extends StatelessWidget {
  static final String title = 'High Agri';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: DashBoardPage(),
      );
}

class DashBoardPage extends StatefulWidget {
  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final List _screens = [
    Dashboard(),
    MaladiesPage(),
    GalleryPage(),
    ProfilPage(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        // endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text(DashboardPageControl.title),
          actions: [
            Image.asset(
              'assets/images/logohagri.png',
            ),
          ],
        ),
        body:
            _screens[_currentIndex], // on retourne l'index de l'écran en cours
        bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => setState(() => _currentIndex = index),
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: Colors.green,
            selectedItemColor: Colors.white,
            backgroundColor: Colors.white,
            iconSize: 30,
            elevation: 0.0,
            currentIndex: _currentIndex,
            items: [
              Icons.home,
              Icons.gpp_maybe_outlined,
              Icons.collections_outlined,
              Icons.perm_identity_outlined
            ]
                .asMap()
                .map((key, value) => MapEntry(
                      key,
                      BottomNavigationBarItem(
                        title: Text(''),
                        icon: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 6.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                              color: _currentIndex == key
                                  ? Colors.green
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Icon(value),
                        ),
                      ),
                    ))
                .values
                .toList()),
      );
}
