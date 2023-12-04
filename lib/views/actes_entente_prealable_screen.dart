import 'package:best_flutter_ui_templates/model/entente_prealable.dart';
import 'package:best_flutter_ui_templates/model/prefinancement.dart';
import 'package:best_flutter_ui_templates/service/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class EntentePrealable extends StatefulWidget {
  const EntentePrealable({Key? key}) : super(key: key);

  @override
  State<EntentePrealable> createState() => _EntentePrealableState();
}

class _EntentePrealableState extends State<EntentePrealable> {
  List<Entente> _ententes = <Entente>[];
  TextEditingController queryTextEditingController = new TextEditingController();
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.yellow,
        title: Text('Entente Préalable => ${_ententes.length}'),
        bottom: PreferredSize(
            child: Text("Actes nécéssitant une entente préalable",
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
                color: Colors.white,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(width: 5, color: Colors.yellowAccent)),
                child: Container(
                  //padding: EdgeInsets.only(top: 50, bottom: 50, left: 1, right: 1),
                  margin: EdgeInsets.only(left: 30),
                  width: 450,
                  height: 100,
                  child: Row(
                    children: [
                      //Text("Montant Total réclamé", style: TextStyle(fontWeight: FontWeight.bold),),
                      Padding(padding: EdgeInsets.only(left: 15, right: 15)),
                      Row(
                        children: [
                          //Text("Montant Total remboursé", style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10),
                  margin: EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: _ententes.isEmpty ?
                  Center( child: CircularProgressIndicator(color: Colors.yellow,)): ListView.builder(
                      itemCount: _ententes.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.lightGreen,
                          color: Colors.grey,
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            child: ListTile(
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.yellowAccent,
                                          child: Text(_ententes[index].code,
                                            style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
                                        ),
                                        SizedBox(width: 2,),
                                        Text(_ententes[index].libelle.toUpperCase(),
                                          style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),)
                                      ],
                                    ),
                                  ],
                                ),
                                /*subtitle: _prefstataires[index].telephone==null ?
                                Center( child: Text('NON RENSEIGNE', style: TextStyle(fontSize: 10, color: Colors.amber, fontWeight: FontWeight.bold))) : Center(
                                  child: Text("Téléphone: "+_prefstataires[index].telephone,
                                    style: TextStyle(fontSize: 12, color: Colors.amber, fontWeight: FontWeight.bold),),
                                )*/
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
    );
  }

  @override
  void initState() {
    super.initState();
    print("oooooooooooooooooooooooooo");
    api.getEntentePrealable().then((value) {
      setState(() {
        _ententes.addAll(value);
      });
    });
    print("ooonjnhbgbgvvgbgfvfvgooo");
  }
}

