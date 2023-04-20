
import 'package:best_flutter_ui_templates/model/prefinancement.dart';
import 'package:best_flutter_ui_templates/service/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ConsomAssure extends StatefulWidget {
  @override
  _ConsomAssureState createState() => _ConsomAssureState();

}


class _ConsomAssureState extends State<ConsomAssure> {
  var client = new http.Client();
  List<dynamic> listPrefinancements = [];
  List<Prefinancement> _prefinancements = <Prefinancement>[];
  dynamic data;
  String query = '';
  TextEditingController queryTextEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    String dateOBDCommand = '2021-07-13T13:15:54.000000Z';
    DateTime date = DateTime.parse(dateOBDCommand);
    String result = DateFormat('yyyy-MM-dd H:m:s').format(date);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.yellow,
        title: Text('Préfinancements => ${_prefinancements.length}'),
        bottom: PreferredSize(
            child: Text("Liste des préfinancements",
                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
            preferredSize: Size.zero),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: NotificationListener(
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              query = value;
                            });
                          },
                          controller: queryTextEditingController,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.list),
                              contentPadding: EdgeInsets.only(left: 20),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.green
                                  )
                              )
                          ),
                        )
                    ),
                  ),
                  IconButton(onPressed: (){
                    setState(() {
                      query = queryTextEditingController.text;
                    });
                  },
                      icon: Icon(Icons.search, color: Colors.green,))
                ],
              ),
              Card(
                //shadowColor: Colors.green,
                color: Colors.lightGreen,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(width: 5, color: Colors.green)),
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                  width: 450,
                  height: 125,
                  child: Row(
                     children: [
                       Text("Montant Total réclamé", style: TextStyle(fontWeight: FontWeight.bold),),
                       Padding(padding: EdgeInsets.only(left: 15, right: 15)),
                       Row(
                         children: [
                           Text("Montant Total remboursé", style: TextStyle(fontWeight: FontWeight.bold),),
                         ],
                       )
                     ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(top: 3),
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(20)),
                  child: _prefinancements.isEmpty ?
                  Center( child: CircularProgressIndicator(color: Colors.yellow,)): ListView.builder(
                    itemCount: _prefinancements.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.blue,
                          color: Colors.black26,
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 28,
                                      backgroundImage: _prefinancements[index].adherent.urlPhoto == null ? NetworkImage('http://192.168.59.252:92/images/6310b8c7f539f9528add8b2a370.png')
                                       : NetworkImage(_prefinancements[index].adherent.urlPhoto),
                                    ),
                                    SizedBox(width: 5,),
                                    Text(_prefinancements[index].adherent.prenom.toUpperCase() +" "+_prefinancements[index].adherent.nom.toUpperCase(),
                                       style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),)
                                  ],
                                ),
                                Card(
                                  child: Text(DateFormat('yyyy-MM-dd H:m:s').format(_prefinancements[index].dateSaisie),
                                    style: TextStyle(fontSize: 12, color: Colors.black, backgroundColor: Colors.amberAccent,
                                        fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                            subtitle: Center(
                              child: Text("Remboursé: "+_prefinancements[index].montantTotalRembourse.toString() +" / "+"Reclamé: "+ _prefinancements[index].montantTotalReclame.toString(),
                                style: TextStyle(fontSize: 15, color: Colors.amber, fontWeight: FontWeight.bold),),
                            )
                          ),
                        );
                      }
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }

  @override
  void initState() {
    super.initState();
    print("oooooooooooooooooooooooooo");
    api.getPrefinancement("4").then((value) {
      setState(() {
        _prefinancements.addAll(value);
      });
    });
    print("ooonjnhbgbgvvgbgfvfvgooo");
  }

}