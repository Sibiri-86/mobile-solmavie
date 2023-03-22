import 'dart:convert';

import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/model/prefinancement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsomAssure extends StatefulWidget {
  @override
  _ConsomAssureState createState() => _ConsomAssureState();
}

class _ConsomAssureState extends State<ConsomAssure> {
  Future getPrefinancementData() async {
    var response =
        await http.get(Uri.http('http://localhost:9090/', 'portail/assureConsommation-sinistre-and-famille'));
    var jsonData = jsonDecode(response.body);
    List<Prefinancement> prefinancements = [];

    for(var u in jsonData){
      Prefinancement prefinancement = Prefinancement(u['id'], u['dateDeclaration'], u['numeroSinistre'], u['dateSaisie'],
          u['nomBenefiniciaire'], u['numeroOrange'], u['numeroMobicash'], u['numeroVirement'], u['dateSoins'], u['montantTotalReclame'],
          u['montantTotalRembourse'], u['montantReclame'], u['montantRembourse']);
      prefinancements.add(prefinancement);
    }
    print(prefinancements.length);
    return prefinancements;
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Consommations de l'assuré "),
            centerTitle: true,
            backgroundColor: Colors.green,
          ),
          backgroundColor:AppTheme.white,
          /**body: Container(
            child: Card(child: FutureBuilder(
              future: getPrefinancementData(),
              builder: (context, snapshot) {
                if(snapshot.data == null) {
                  return Container(
                    child: Center(
                      child: Text('Chargement. ..'),
                    ),
                  );
                } else return ListView.builder(itemCount: snapshot.data.length, itemBuilder: itemBuilder)
              }
            ),),
          )*/
        ),
      ),
    );
  }
}
