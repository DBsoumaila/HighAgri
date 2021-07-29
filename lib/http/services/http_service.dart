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
      throw "Impossible de recuérer les données";
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
