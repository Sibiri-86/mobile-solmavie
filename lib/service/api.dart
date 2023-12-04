import 'dart:convert';

import 'package:best_flutter_ui_templates/constant.dart';
import 'package:best_flutter_ui_templates/model/adherent.dart';
import 'package:best_flutter_ui_templates/model/plafondSousActe.dart';
import 'package:best_flutter_ui_templates/openid_io.dart';
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




  }


  Future<List<PlafondSousActe>> findBareme() async {
    print("====================wiwiwiw=====4======");
    List<PlafondSousActe> plafonds = [];
    String username ="1";


    var response = await client.get(Uri.parse('$endpoint/contrat/plafond/username-connect' + '?' +username));
    //var parsed = json.decode(utf8.decode(response.bodyBytes));
    var parsed = json.decode(utf8.decode(response.bodyBytes));
    print("====================wiwiwiw===========");
    print(parsed);
    /*parsed.forEach((element) {
      PlafondSousActe data = PlafondSousActe.fromJson(json.decode(element));
      plafonds.add(data);
    });*/




    return plafonds;
  }


}