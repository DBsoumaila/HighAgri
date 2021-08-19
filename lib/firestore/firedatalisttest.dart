import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ha2/firestore/databaseManager.dart';

class TestDataFromFire extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<TestDataFromFire> {
  List userProfilesList = [];

  String userID = "";

  @override
  void initState() {
    super.initState();

    fetchDatabaseList();
  }

  fetchDatabaseList() async {
    dynamic resultant = await DatabaseManager().getGalleryPicList();

    if (resultant == null) {
      print('Unable to retrieve');
    } else {
      setState(() {
        userProfilesList = resultant;
      });
    }
  }

  updateData(String name, String gender, int score, String userID) async {
    await DatabaseManager().updateUserList(name, gender, score, userID);
    fetchDatabaseList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          automaticallyImplyLeading: false,
          actions: [
            RaisedButton(
              onPressed: () {},
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
              color: Colors.deepPurple,
            ),
            RaisedButton(
              onPressed: () async {},
              child: Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
              color: Colors.deepPurple,
            )
          ],
        ),
        body: Container(
            child: ListView.builder(
                itemCount: userProfilesList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(userProfilesList[index]['nom']),
                      subtitle: Text(userProfilesList[index]['email']),
                      leading: CircleAvatar(
                        child: Image(
                          image: AssetImage('assets/images/profil_girl.jpg'),
                        ),
                      ),
                      trailing: Text('${userProfilesList[index]['telephone']}'),
                    ),
                  );
                })));
  }
}
