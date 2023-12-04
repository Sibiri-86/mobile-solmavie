

class ProduitExclu {
  String id ='';
  String code ='';
  String description ='';
  String libelle ='';
  String typeProduit ='';
  //private Boolean isExclu;


  ProduitExclu.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    code= json['code'];
    libelle= json['libelle'];
    description= json['description'];
    typeProduit= json['typeProduit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['libelle'] = this.libelle;
    data['description'] = this.description;
    data['typeProduit'] = this.typeProduit;
    return data;
  }

}

