import 'package:flutter/material.dart';
import 'package:ha2/http/services/http_service.dart';
import 'package:ha2/models/post.dart';

class PostDetail extends StatelessWidget {
  final Post post;
  final HttpService httpService = HttpService();
  PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(post.title),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await httpService.deletePost(post.id);
                Navigator.of(context).pop();
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Card(
                  elevation: 5.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        title: Text("Titre"),
                        subtitle: Text(post.title),
                      ),
                      ListTile(
                        title: Text("ID"),
                        subtitle: Text("${post.id}"),
                      ),
                      ListTile(
                        title: Text("Body"),
                        subtitle: Text(post.body),
                      ),
                      ListTile(
                        title: Text("User ID"),
                        subtitle: Text("${post.userId}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
