import 'dart:convert';
import 'dart:ffi';

import 'package:best_flutter_ui_templates/constant.dart';
import 'package:best_flutter_ui_templates/model/adherent.dart';
import 'package:best_flutter_ui_templates/model/entente_prealable.dart';
import 'package:best_flutter_ui_templates/model/prefinancement.dart';
import 'package:best_flutter_ui_templates/model/prestataire.dart';
import 'package:best_flutter_ui_templates/model/produit_exclu.dart';
import 'package:best_flutter_ui_templates/service/Api.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
Api api = new Api();
class Api {
  static const endpoint = 'http://192.168.59.142:9090/assurance';
  //static const endpoint = 'http://192.168.43.171:9090/assurance';
  var client = new http.Client();
  Future<Adherent> getUserProfile(String  numero) async {
    print("===========numero=====================");


    var response = await client.get(Uri.parse('$endpoint/contrat/adherent/getAssureByNumero-adherent'));
    print("===========numero======2===============");
    print(response.body);

    print("===========numero======2===============");
    return Adherent.fromJson(json.decode(response.body));
  }

  /*Future<List<Prefinancement>> getPrefinancement(String adherentId) async {
    var prefinancements = <Prefinancement>[];
    var response = await client.put(Uri.parse('$endpoint/portail/assureConsommation-sinistre-and-famille-for-mobile/${adherentId}'));
    var parsed = json.decode(response.body) as List<dynamic>;
    print("===========numero======3333333======4=========");
    print(response.body);
    for (var post in parsed) {
      prefinancements.add(Prefinancement.fromJson(post));
    }
    print("===========prefinancement======3333333===============");
    print(prefinancements.length);
    print(prefinancements);
    return prefinancements;

  }*/

  Future<List<Prefinancement>> getPrefinancement(String adherentId) async {
    print("=======id: "+adherentId);
    var response = await client.put(Uri.parse(EndPoint.GET_PREFINANCEMENT_URL+'/${adherentId}'));
    var pref = <Prefinancement>[];
    print("=======endpoint: "+ EndPoint.GET_PREFINANCEMENT_URL+'/${adherentId}');
    if(response.statusCode == 200) {
      var prefsJson = json.decode(response.body);
      for (var prefJson in prefsJson) {
        pref.add(Prefinancement.fromJson(prefJson));
      }
    }
    return pref;

  }


  Future<List<Prestataire>> getPrestataire() async {
    var response = await client.get(Uri.parse(EndPoint.GET_PRESTATAIRE_URL));
    print("=======endpoint: "+ EndPoint.GET_PRESTATAIRE_URL);
    var prestataire = <Prestataire>[];
    //if(response.statusCode == 200) {
      var prefsJson = json.decode(response.body);
      for (var prefJson in prefsJson) {
        prestataire.add(Prestataire.fromJson(prefJson));
      }
    //}
    print("=======prestataire");
    print(prestataire.length);
    return prestataire;

  }

  Future<List<Entente>> getEntentePrealable() async {
    var response = await client.get(Uri.parse(EndPoint.GET_ACTES_ENTENTE_PREALABLE_URL));
    print("=======endpoint: "+ EndPoint.GET_ACTES_ENTENTE_PREALABLE_URL);
    var entente = <Entente>[];
    //if(response.statusCode == 200) {
    var prefsJson = json.decode(response.body);
    for (var prefJson in prefsJson) {
      entente.add(Entente.fromJson(prefJson));
    }
    //}
    print("=======entente");
    print(entente.length);
    return entente;

  }

  Future<List<ProduitExclu>> getProduitExclus(int numero) async {
    var response = await client.get(Uri.parse(EndPoint.GET_PRODUIT_EXCLU_URL+'?numero=${numero}'));
    print("=======endpoint: "+ EndPoint.GET_PRODUIT_EXCLU_URL+'/${numero}');
    var produitExclu = <ProduitExclu>[];
    //if(response.statusCode == 200) {
    print(response.body);
    var prefsJson = json.decode(response.body);
    print(prefsJson);
    for (var prefJson in prefsJson) {
      produitExclu.add(ProduitExclu.fromJson(prefJson));
    }
    //}
    print("=======produitExclu");
    print(produitExclu.length);
    return produitExclu;
  }

  Future<List<ProduitExclu>> getProduitRachetes(int numero) async {
    var response = await client.get(Uri.parse(EndPoint.GET_PRODUIT_RACHETE_URL));
    print("=======endpoint: "+ EndPoint.GET_PRODUIT_RACHETE_URL);
    var produitRachete = <ProduitExclu>[];
    //if(response.statusCode == 200) {
    var prefsJson = json.decode(response.body);
    for (var prefJson in prefsJson) {
      produitRachete.add(ProduitExclu.fromJson(prefJson));
    }
    //}
    print("=======produit");
    print(produitRachete.length);
    return produitRachete;
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