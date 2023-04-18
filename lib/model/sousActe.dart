
class SousActe {
  String id ='';
  String libelle = '';
  String description = '';

  SousActe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    libelle = json['libelle'];
    description = json['description'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['libelle'] = this.libelle;
    data['description'] = this.description;
    return data;
  }
}
