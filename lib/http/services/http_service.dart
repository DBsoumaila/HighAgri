import 'dart:convert';
import 'package:ha2/models/post.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpService {
  var postsURL = Uri.parse("https://jsonplaceholder.typicode.com/posts");

// recupération des valeurs de posts venant du web à travers une Uri
  Future<List<Post>> getPosts() async {
    Response res = await get(postsURL);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Impossible de recupérer les données";
    }
  }

// suppression
  Future<void> deletePost(int id) async {
    var deleteUri = Uri.parse('$postsURL/$id');
    Response res = await delete(deleteUri);

    if (res.statusCode == 200) {
      print("Bien supprimé");
    } else {
      throw "Impossible de supprimer";
    }
  }

  //soumission de données au serveur via un lien

  Future createPost(Uri url, {required Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception(
            "Une erreur est survénue lors de la soumission de vos données");
      }
      return Post.fromJson(json.decode(response.body));
    });
  }

  Future<Traitement> createAlbum(String title, String imagePath, key) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'title': title, 'image': imagePath}),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Traitement.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create Traitement.');
    }
  }

// Call Web services

// a fonction de services
/*
new RaisedButton(
                  onPressed: () async {
                    Post newPost = new Post(
                        userId: "123", id: 0, title: titleControler.text, body: bodyControler.text);
                    Post p = await createPost(CREATE_POST_URL,
                        body: newPost.toMap());
                    print(p.title);
                  },


*/
}

class Traitement {
  final int id;
  final String title;
  final String image;

  Traitement({required this.id, required this.title, required this.image});

  factory Traitement.fromJson(Map<String, dynamic> json) {
    return Traitement(
        id: json['id'], title: json['title'], image: json['image']);
  }
}
