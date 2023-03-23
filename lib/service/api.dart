import 'dart:convert';
import 'dart:io';

import 'package:best_flutter_ui_templates/model/adherent.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:openid_client/openid_client.dart';

@lazySingleton
class Api {
  static const endpoint = 'http://192.168.59.153:9090/assurance';
  var client = new http.Client();
  Future<Adherent> getUserProfile(String  numero) async {

    var response = await client.get(Uri.parse('$endpoint/contrat/adherent/getByNumero-adherent'));
    print("===========numero======2===============");
    print(response.statusCode);
    print("===========numero======2===============");
    return Adherent.fromJson(json.decode(response.body));
  }

 /* Future<List<Post>> getPostsForUser(int userId) async {
    var posts = List<Post>();
    var response = await client.get('$endpoint/posts?userId=$userId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var post in parsed) {
      posts.add(Post.fromJson(post));
    }

    return posts;
  }

  Future<List<Comment>> getCommentsForPost(int postId) async {
    var comments = List<Comment>();
    var response = await client.get('$endpoint/comments?postId=$postId');
    var parsed = json.decode(response.body) as List<dynamic>;
    for (var comment in parsed) {
      comments.add(Comment.fromJson(comment));
    }
    return comments;
  }
*/
}