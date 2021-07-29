import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ha2/pages/authentification/login.dart';
import 'package:ha2/pages/authentification/signup.dart';
import 'package:ha2/widget/btn_widget.dart';
import 'package:ha2/widget/header_container.dart';

class ForgetedPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Passe Oublié'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: EdgeInsets.only(bottom: 10),
          child: StaggeredGridView.count(
            crossAxisCount: 4,
            children: <Widget>[
              Column(
                children: <Widget>[
                  HeaderContainer("Réinitialiser"),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          _textInput(hint: "Email", icon: Icons.email),
                          // _textInput(hint: "Password", icon: Icons.vpn_key),
                          Expanded(
                            child: Center(
                              child: ButtonWidget(
                                onClick: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegPage()));
                                },
                                btnText: "CHANGER",
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 0.0),
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: Text("Me connecter")),
                              ),
                              Container(
                                child: Text('|'),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => RegPage()));
                                  },
                                  child: Text("Créer un compte")),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
            staggeredTiles: [
              StaggeredTile.extent(4, 650.0),
            ],
          ),
        ),
      );
}

Widget _textInput({controller, hint, icon}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      color: Colors.white,
    ),
    padding: EdgeInsets.only(left: 10),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        prefixIcon: Icon(icon),
      ),
    ),
  );
}
