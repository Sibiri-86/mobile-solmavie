
class Taux {
  String id ='';
  BigInt taux  = BigInt.zero;
  String description = '';

  Taux.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    taux = json['taux'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['taux'] = this.taux;
    data['description'] = this.description;
    return data;
  }
}
