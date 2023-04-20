import 'package:best_flutter_ui_templates/locator.dart';
import 'package:best_flutter_ui_templates/service/Api.dart';

//const api = 'http://192.168.1.88:9090/assurance';
const api = 'http://192.168.59.142:9090/assurance';
class EndPoint {
  static final GET_PREFINANCEMENT_URL = "$api/portail/assureConsommation-sinistre-and-famille-for-mobile";
  static final GET_PRESTATAIRE_URL = "$api/parametrage/prestataire/mobile";
  static final GET_ACTES_ENTENTE_PREALABLE_URL = "$api/parametrage/typeSousActe/entente-exclus/mobile";
  static final GET_PRODUIT_EXCLU_URL = "$api/portail/find-assure-rachat-by-sous-groupe";
  static final GET_PRODUIT_RACHETE_URL = "$api/portail/assure-ProduitPharmaceutiqueExclu-sous-groupe";
/*static final IMAGE_LISTE_URL = "$api/image-list";
  static final ANNONCE_LISTE = "$api/annonce-mob";
  static final ANNONCE_LISTE2 = "$api/annonce-mob-pages";
  static final LOGIN_URL = "$api/authenticate-mob";
  static final COMPTE_URL = "$api/compte";
  static final RESET_PASSWORD_URL = "$api/reset-password/init";
  static final USER_URL = "$api/user";
  static final USER_VILLE = "$api/ville-mob";*/
}