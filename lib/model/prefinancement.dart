import 'dart:convert';

import 'package:best_flutter_ui_templates/model/adherent.dart';


class Prefinancement {
  String id='';
  DateTime dateDeclaration= DateTime.now();
  String numeroSinistre='';
  DateTime dateSaisie = DateTime.now();
  String nomBenefiniciaire='';
  String numeroOrange='';
  String numeroMobicash='';
  String numeroVirement='';
  DateTime dateSoins= DateTime.now();
  int montantTotalReclame= 0 ;
  int montantTotalRembourse= 0 ;
  int montantReclame= 0 ;
  int montantRembourse= 0 ;
  dynamic adherent = Adherent();

  String image ='http://192.168.59.252:92/images/6373a8ee1f19a15e185188ad1.jpg';
  //var adherent = Adherent;
  //Adherent adherent = new Adherent();

  Prefinancement.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    //dateDeclaration= json['dateDeclaration'];
    numeroSinistre= json['numeroSinistre'];
    //dateSaisie= json['dateSaisie'];
    nomBenefiniciaire= json['nomBenefiniciaire'];
    numeroOrange= json['numeroOrange'];
    numeroMobicash= json['numeroMobicash'];
    numeroVirement= json['numeroVirement'];
    //dateSoins= json['dateSoins'];
    montantTotalReclame= json['montantTotalReclame'];
    montantTotalRembourse= json['montantTotalRembourse'];
    montantReclame= json['montantReclame'];
    montantRembourse= json['montantRembourse'];
    image = json['image'];
    adherent= Adherent.fromJson(json['adherent']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateDeclaration'] = this.dateDeclaration;
    data['numeroSinistre'] = this.numeroSinistre;
    data['dateSaisie'] = this.dateSaisie;
    data['nomBenefiniciaire'] = this.nomBenefiniciaire;
    data['numeroOrange'] = this.numeroOrange;
    data['numeroMobicash'] = this.numeroMobicash;
    data['numeroVirement'] = this.numeroVirement;
    data['dateSoins'] = this.dateSoins;
    data['montantTotalReclame'] = this.montantTotalReclame;
    data['montantTotalRembourse'] = this.montantTotalRembourse;
    data['montantReclame'] = this.montantReclame;
    data['montantRembourse'] = this.montantRembourse;
    data['image'] = this.image;
    data['adherent'] = this.adherent;
    return data;
  }

}

