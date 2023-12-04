import 'package:best_flutter_ui_templates/model/produit_exclu.dart';
import 'package:flutter/material.dart';

import '../service/api.dart';


class ProduitExcluExclu extends StatefulWidget {
  const ProduitExcluExclu({Key? key}) : super(key: key);

  @override
  State<ProduitExcluExclu> createState() => _ProduitExcluExcluState();
}

class _ProduitExcluExcluState extends State<ProduitExcluExclu> {

  List<ProduitExclu> _produitExclus = <ProduitExclu>[];
  TextEditingController queryTextEditingController = new TextEditingController();
  String query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.yellow,
        title: Text('Produit(s) Exclu(s)'),
        bottom: PreferredSize(
            child: Text("Liste des produits exclus du la police",
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
                  decoration: BoxDecoration(color: Colors.green[200], borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: _produitExclus.isEmpty ?
                  Center( child: CircularProgressIndicator(color: Colors.yellow,)): ListView.builder(
                      itemCount: _produitExclus.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: Colors.lightGreen,
                          color: Colors.green[500],
                          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 25,
                                        backgroundColor: Colors.lightGreen,
                                        child: Text(_produitExclus[index].code,
                                          style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
                                      ),
                                      SizedBox(width: 2,),
                                      Text(_produitExclus[index].libelle.toUpperCase(),
                                        style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),)
                                    ],
                                  ),
                                ],
                              ),
                              subtitle: _produitExclus[index].typeProduit==null ?
                              Center( child: Text('NON RENSEIGNE', style: TextStyle(fontSize: 10, color: Colors.amber, fontWeight: FontWeight.bold))) : Center(
                                child: Text("Type: "+_produitExclus[index].typeProduit,
                                  style: TextStyle(fontSize: 12, color: Colors.amber, fontWeight: FontWeight.bold),),
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
      //backgroundColor: Colors.grey[300],
    );
  }

  @override
  void initState() {
    super.initState();
    print("oooooooooooooooooooooooooo");
    api.getProduitExclus(4).then((value) {
      setState(() {
        _produitExclus.addAll(value);
        print(_produitExclus.length);
      });
    });
    print("ooonjnhbgbgvvgbgfvfvgooo");
  }
}
