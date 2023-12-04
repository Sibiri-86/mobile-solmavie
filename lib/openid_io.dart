import 'dart:convert';
import 'dart:io';

import 'package:best_flutter_ui_templates/locator.dart';
import 'package:best_flutter_ui_templates/service/Api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:openid_client/openid_client.dart';
// import the io version
import 'package:openid_client/openid_client_io.dart';
// use url launcher package
import 'package:url_launcher/url_launcher.dart';
import 'package:openid_client/openid_client_io.dart' as io;


late final UserInfo userInfo;
late Credential  credential;
late Client  client;
final _api = locator<Api>();
late TokenResponse token;
late String userAccessToken;
Future<Credential> authenticate(Client client, BuildContext context,
    {List<String> scopes = const []}) async {

  // create a function to open a browser with an url
  urlLauncher(String url) async {
    var uri = Uri.parse(url);

    print("===========URLLLLLL================"+url);


    if ( Platform.isAndroid) {

      await launchUrl(uri );
    } else {
      throw 'Could not  launch $url';
    }
  }
  var authenticator = new Authenticator(client,
      scopes: scopes, port: 3000, urlLancher: urlLauncher);

  /*var authenticator = io.Authenticator(client,
      scopes: scopes, port: 3000,urlLancher: urlLauncher);*/

  var c = await authenticator.authorize();

  print("==============idToken==========");
  c.getTokenResponse().then((value) => {
  print(value),
  });

   credential = c;


   if (Platform.isAndroid || Platform.isIOS) {
     await closeInAppWebView();

  }



  token = await c.getTokenResponse(true);
  if(token.idToken !=null) {
    userAccessToken = token.refreshToken!;
    print("==============idToken===1=======");
    print(token.refreshToken);
    print(token.refreshToken);
    print(token.refreshToken);
  }



  return c;
}

String getTockend() {
  return userAccessToken;
}


Credential getCredential() {
  return credential;
}

Future<Credential?> getRedirectResult(Client client,
    {List<String> scopes = const []}) async {
  return null;
}