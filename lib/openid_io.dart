import 'dart:convert';
import 'dart:io';

import 'package:best_flutter_ui_templates/locator.dart';
import 'package:best_flutter_ui_templates/service/Api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:openid_client/openid_client_io.dart' as io;


late final UserInfo userInfo;
late Credential  credential;
late Client  client;
final _api = locator<Api>();
Future<Credential> authenticate(Client client, BuildContext context,
    {List<String> scopes = const []}) async {




  /*var uri = Uri.parse(keycloakUri);
  if (!kIsWeb && Platform.isAndroid) uri = uri.replace(host: '10.0.2.2');
  var clientId = 'mobile-app';

  var issuer = await Issuer.discover(uri);
   client = Client(issuer, clientId);
*/

  // create a function to open a browser with an url
  urlLauncher(String url) async {
    var uri = Uri.parse(url);
print("=====================url============="+url);

    if ( Platform.isAndroid) {
     /* await launch(url,

        forceWebView: true,

      );*/
      await launchUrl(uri );
    } else {
      throw 'Could not  launch $url';
    }
  }

  var authenticator = io.Authenticator(client,
      scopes: scopes, port: 3000,redirectUri: Uri.parse('http://localhost:3000'), urlLancher: urlLauncher);

  var c = await authenticator.authorize();



  print("==============idToken==========");
   credential = c;
   if (Platform.isAndroid || Platform.isIOS) {
     await closeInAppWebView();

  }



  return c;
}




Credential getCredential() {
  return credential;
}

Future<Credential?> getRedirectResult(Client client,
    {List<String> scopes = const []}) async {
  return null;
}