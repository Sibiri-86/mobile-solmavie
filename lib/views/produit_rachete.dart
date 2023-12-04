import 'package:flutter/material.dart';


class ProduitRachete extends StatefulWidget {
  const ProduitRachete({Key? key}) : super(key: key);

  @override
  State<ProduitRachete> createState() => _ProduitRacheteState();
}

class _ProduitRacheteState extends State<ProduitRachete> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.yellow,
        title: Text('Produit(s) Racheté(s)'),
        bottom: PreferredSize(
            child: Text("Liste des produits rachetés de la police",
                style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)),
            preferredSize: Size.zero),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Ici le body des produits rachetés'),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
