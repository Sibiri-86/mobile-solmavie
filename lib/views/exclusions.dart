import 'package:best_flutter_ui_templates/views/produit_exclu.dart';
import 'package:best_flutter_ui_templates/views/produit_rachete.dart';
import 'package:flutter/material.dart';


class ProduitExclus extends StatefulWidget {
  const ProduitExclus({Key? key}) : super(key: key);

  @override
  State<ProduitExclus> createState() => _ProduitExclusState();
}

class _ProduitExclusState extends State<ProduitExclus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.yellow,
        title: Text('Exclusions'),
        bottom: PreferredSize(
            child: Text("Gestion des exclusions et rachats de produit",
                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
            preferredSize: Size.zero),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 150, left: 70),
        child: Expanded(
          child: Column(
            children: [
              Container(
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context, 
                      MaterialPageRoute(
                          builder:(context) => ProduitExcluExclu()));
                  print("button 1 pressed");
                }, child: Text('Produit(s) Exclu(s)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    fixedSize: Size(250, 125),
                    side: BorderSide(color: Colors.amberAccent, width:2),
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),
                ),
              ),
              SizedBox(height: 100,),
              Container(
                child: ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder:(context) => ProduitRachete()));
                print("button 2 pressed");
              }, child: Text('Produit(s) Racheté(s)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    fixedSize: Size(250, 125),
                    side: BorderSide(color: Colors.amberAccent, width: 2),
                    shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  ),),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}

