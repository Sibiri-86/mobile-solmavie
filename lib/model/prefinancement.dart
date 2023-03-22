class Prefinancement {
  final String id;
  //final PoliceDto police;
  final DateTime dateDeclaration;
  final String numeroSinistre;
  //final OrdreReglementDto ordreReglement;
  //final List<PrestationDto> prestation;
  //final AdherentDto adherent;
  final DateTime dateSaisie;
  //final TypeEtatSinistre etat;
  //final BonPriseEnChargeDto bonPriseEnCharge;
  //final TypePaiement typePaiement;
  final String nomBenefiniciaire;
  final String numeroOrange;
  final String numeroMobicash;
  final String numeroVirement;
  final DateTime dateSoins;
  final BigInt montantTotalReclame;
  final BigInt montantTotalRembourse;
  final BigInt montantReclame;
  final BigInt montantRembourse;

  Prefinancement(
      this.id,
      this.dateDeclaration,
      this.numeroSinistre,
      this.dateSaisie,
      this.nomBenefiniciaire,
      this.numeroOrange,
      this.numeroMobicash,
      this.numeroVirement,
      this.dateSoins,
      this.montantTotalReclame,
      this.montantTotalRembourse,
      this.montantReclame,
      this.montantRembourse);
}

