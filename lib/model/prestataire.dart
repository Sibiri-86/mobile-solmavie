import 'dart:convert';

import 'package:best_flutter_ui_templates/model/adherent.dart';


class Prestataire {
  String id='';
  String code = '';
  String description = '';
  String libelle = '';
  String idTypePrestataire = '';
  String codeTypePrestataire = '';
  String libelleTypePrestataire = '';
  String idNaturePrestataire = '';
  String codeNaturePrestataire = '';
  String libelleNaturePrestataire = '';
  String telephone = '';
  String idDepartement = '';
  String codeDepartement = '';
  String libelleDepartement = '';
  String responsable = '';
  double longitude = 0;
  double latitude = 0;
  String codeQuartier = '';
  String idQuartier = '';
  String libelleQuartier = '';


  Prestataire.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    code= json['code'];
    description= json['description'];
    libelle= json['libelle'];
    idTypePrestataire= json['idTypePrestataire'];
    codeTypePrestataire= json['codeTypePrestataire'];
    idNaturePrestataire= json['idNaturePrestataire'];
    codeNaturePrestataire= json['codeNaturePrestataire'];
    libelleNaturePrestataire= json['libelleNaturePrestataire'];
    telephone= json['telephone'];
    idDepartement= json['idDepartement'];
    codeDepartement= json['codeDepartement'];
    libelleDepartement = json['libelleDepartement'];
    responsable= json['responsable'];
    longitude= json['longitude'];
    latitude= json['latitude'];
    codeQuartier = json['codeQuartier'];
    idQuartier= json['idQuartier'];
    libelleQuartier = json['libelleQuartier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['libelle'] = this.libelle;
    data['idTypePrestataire'] = this.idTypePrestataire;
    data['codeTypePrestataire'] = this.codeTypePrestataire;
    data['idNaturePrestataire'] = this.idNaturePrestataire;
    data['codeNaturePrestataire'] = this.codeNaturePrestataire;
    data['libelleNaturePrestataire'] = this.libelleNaturePrestataire;
    data['telephone'] = this.telephone;
    data['idDepartement'] = this.idDepartement;
    data['codeDepartement'] = this.codeDepartement;
    data['libelleDepartement'] = this.libelleDepartement;
    data['responsable'] = this.responsable;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['codeQuartier'] = this.codeQuartier;
    data['idQuartier'] = this.idQuartier;
    data['libelleQuartier'] = this.libelleQuartier;
    return data;
  }

}

