
import 'package:best_flutter_ui_templates/model/sousActe.dart';
import 'package:best_flutter_ui_templates/model/taux.dart';

class PlafondSousActe {
  String id ='';
  DateTime? dateEffet;
  BigInt montantPlafond = BigInt.zero;
  BigInt montantPlafondParActe = BigInt.zero;
  BigInt nombre = BigInt.zero;
  String libelle ='';
  SousActe? sousActe;
  Taux? taux;

  PlafondSousActe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateEffet = json['dateEffet'];
    montantPlafond = json['montantPlafond'];
    montantPlafondParActe = json['montantPlafondParActe'];
    nombre = json['nombre'];
    libelle = json['libelle'];
    sousActe = json['sousActe'];
    taux = json['taux'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateEffet'] = this.dateEffet;
    data['montantPlafond'] = this.montantPlafond;
    data['montantPlafondParActe'] = this.montantPlafondParActe;
    data['nombre'] = this.nombre;
    data['libelle'] = this.libelle;
    data['sousActe'] = this.sousActe;
    data['taux'] = this.taux;
    return data;
  }
}
