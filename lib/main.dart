import 'dart:ffi';
import 'dart:io';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:best_flutter_ui_templates/imageVimso.dart';
import 'package:best_flutter_ui_templates/locator.dart';
import 'package:best_flutter_ui_templates/model/adherent.dart';
import 'package:best_flutter_ui_templates/openid_io.dart';
import 'package:best_flutter_ui_templates/service/Api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:splashscreen/splashscreen.dart';
import 'navigation_home_screen.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:openid_client/openid_client_io.dart' if (dart.library.html) 'openid_browser.dart';
const keycloakUri = 'http://192.168.59.153:8080/auth/realms/Vimso';
const scopes = ['profile'];

Credential? credential;
late final Client client;
final Api _api = locator<Api>();
Future<Client> getClient() async {
  var uri = Uri.parse(keycloakUri);
  if (!kIsWeb && Platform.isAndroid) uri = uri.replace(host: '10.0.2.2');
  var clientId = 'mobile-app';

  var issuer = await Issuer.discover(uri);
  return Client(issuer, clientId);
}
void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));

    return FutureBuilder(
      future: getClient(),
      builder: (context, AsyncSnapshot<Client> client) {

        if(client.hasData) {
          return FutureBuilder(
            future:authenticate(client.requireData,context, scopes: scopes),
            builder: (context ,AsyncSnapshot<Credential> datas) {

             
              if(datas.hasData) {
                _api.getUserProfile("1");
                return  buitApp(NavigationHomeScreen());
                 /* return FutureBuilder(
                  future:_api.getUserProfile("1"),
                  builder: (context ,AsyncSnapshot<Adherent> adh) {
                    if(adh.hasData) {
                      print("============adh===========");
                      print("============adh===========");
                      return  buitApp(NavigationHomeScreen());
                    } else {
                      return buitApp(Feed());
                    }

                  }
                  );*/





              } else {
                print("============48===========");
                return  buitApp(NavigationHomeScreen());
              }
            },
          );


        }  else {
          return buitApp(Feed());
        }

      },
    );
   /* return MaterialApp(
      title: 'Solmavi',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: NavigationHomeScreen(),
    );*/
  }
}
MaterialApp buitApp(Widget elem){
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Solmavi',
    home: elem,

  );
}
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
