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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        foregroundColor: Colors.yellow,
        title: Text('Entente Préalable'),
    centerTitle: true,
    backgroundColor: Colors.green,
    ),
      body: (
        Center(
          child: Text(
            "ici le boody"
          ),
        )
      ),
    );
  }
}

