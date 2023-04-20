

class Entente {
  String id='';
  String code ='';
  String libelle ='';
  String description ='';
  //Boolean deleted = Boolean.FALSE;
  String idTypeActe ='';
  String libelleTypeActe ='';
  String codeTypeActe ='';
  //BigDecimal  montantConvantion = 0;
  String idGenre ='';
  String libelleGenre ='';
  //Boolean isEntente = Boolean.FALSE;
  //Boolean isNewBareme = Boolean.FALSE;


  Entente.fromJson(Map<String, dynamic> json) {
    id= json['id'];
    code= json['code'];
    libelle= json['libelle'];
    description= json['description'];
    idTypeActe= json['idTypeActe'];
    libelleTypeActe= json['libelleTypeActe'];
    codeTypeActe= json['codeTypeActe'];
    idGenre= json['idGenre'];
    libelleGenre= json['libelleGenre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['libelle'] = this.libelle;
    data['description'] = this.description;
    data['idTypeActe'] = this.idTypeActe;
    data['libelleTypeActe'] = this.libelleTypeActe;
    data['codeTypeActe'] = this.codeTypeActe;
    data['idGenre'] = this.idGenre;
    data['libelleGenre'] = this.libelleGenre;
    return data;
  }

}

