import 'package:best_flutter_ui_templates/home_screen.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Feed extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SOLMAVI',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(
          seconds: 100,
          //navigateAfterSeconds:MyApp(),
          title: new Text(
            'SOLMAVI',
            style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white),

          ),
          image: Image.asset("assets/images/feedbackImage.png"),
          backgroundColor: Colors.lightBlue[200],
        )
    );
  }
}