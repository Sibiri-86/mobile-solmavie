import 'dart:convert';

import 'package:best_flutter_ui_templates/model/adherent.dart';
import 'package:best_flutter_ui_templates/model/plafondSousActe.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@lazySingleton
class Api {
  static const endpoint = 'http://192.168.1.89:9090/assurance';
  var client = new http.Client();
  Future<Adherent> getUserProfile(String  numero) async {

    var response = await client.get(Uri.parse('$endpoint/contrat/adherent/getAssureByNumero-adherent'));
    print("=====================url=======1======");
    print(json.decode(response.body));
    return Adherent.fromJson(json.decode(response.body));
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