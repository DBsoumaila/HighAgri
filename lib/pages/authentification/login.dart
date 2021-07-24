import 'package:flutter/material.dart';
import 'package:ha2/pages/authentification/signup.dart';
import 'package:ha2/widget/btn_widget.dart';
import 'package:ha2/widget/header_container.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        //drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
          body: Container(
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: <Widget>[
            HeaderContainer("Login"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    _textInput(hint: "Email", icon: Icons.email),
                    _textInput(hint: "Password", icon: Icons.vpn_key),
                  
                    Expanded(
                      child: Center(
                        child: ButtonWidget(
                          onClick: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegPage()));
                          },
                          btnText: "LOGIN",
                        ),
                      ),
                    ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Don't have an account ? ",
                            style: TextStyle(color: Colors.black)),
                      
                      ]),
                    ),
                     TextButton(onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegPage()));
                          }, child: Text("Enregistrer")),

                    ],
                  ),
                    Container(
                      margin: EdgeInsets.only(top: 1.0),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot Password?",
                      ),
                    ),
                    
                  ],
                ),
              ),
            )
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
