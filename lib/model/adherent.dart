
class Adherent {
  String id ='';
  String matriculeGarant='';
  String nomAdherent ='';
  String nom ='';
  String prenom ='';
  int numero = 0;
  String urlPhoto ='';

  Adherent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    matriculeGarant = json['matriculeGarant'];
    nomAdherent = json['nomAdherent'];
    numero = json['numero'];
    nom = json['nom'];
    prenom = json['prenom'];
    urlPhoto = json['urlPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['matriculeGarant'] = this.matriculeGarant;
    data['nomAdherent'] = this.nomAdherent;
    data['numero'] = this.numero;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['urlPhoto'] = this.urlPhoto;
    return data;
  }



  Adherent();
}