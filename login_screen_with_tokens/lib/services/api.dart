import 'dart:io';

import 'package:dio/dio.dart';
import 'package:oauth2/oauth2.dart' as oauth2;
import 'package:http/http.dart' as http;

class ApiServices {
  late String baseUrl= 'your_request_base_url';
  var dio = Dio();
  String accessTokenData = '';
  String ccAccessTokenData = '';
  String refreshTokenData = '';
  Uri? tokenEndpointData;
  List scopesData = [];
  String? idTokenData;
  DateTime? expirationDate;
  String? email;
  String? password;
  final authorizationEndpoint = Uri.parse('your_api_address');

  Future login(usernameText, passwordText) async {
    final username = usernameText.toString();
    final password = passwordText.toString();
    final identifier = 'your_token_identifier';
    final secret = 'your_secret_code';

    await oauth2
        .resourceOwnerPasswordGrant(authorizationEndpoint, username, password, identifier: identifier, secret: secret)
        .then((value){
      if(value.credentials.accessToken != null){
        accessTokenData = value.credentials.accessToken;
        refreshTokenData = value.credentials.refreshToken!;
        expirationDate = value.credentials.expiration;
        idTokenData = value.credentials.idToken;
        scopesData = value.credentials.scopes!;
        tokenEndpointData = value.credentials.tokenEndpoint;
      }
    });
  }

  Future signup(email, phone, password, token) async {
    final response = await dio.post("$baseUrl/Accounts/SignUp",
        data: {'email': email, 'phoneNumber': phone, 'password': password},
        options: Options(headers: {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"})
    );
    final id = response.data["data"]["id"];
    if(id != null){
      final identifier = 'your_token_identifier';
      final secret = 'your_secret_code';

      await oauth2
          .resourceOwnerPasswordGrant(authorizationEndpoint, email, password, identifier: identifier, secret: secret)
          .then((value){
        if(value.credentials.accessToken != null){
          accessTokenData = value.credentials.accessToken;
          refreshTokenData = value.credentials.refreshToken!;
          expirationDate = value.credentials.expiration;
          idTokenData = value.credentials.idToken;
          scopesData = value.credentials.scopes!;
          tokenEndpointData = value.credentials.tokenEndpoint;
        }
      });
    }
  }

  Future clientCredentials() async{
    final response = await dio.post("$baseUrl", options: Options(headers: {HttpHeaders.contentTypeHeader : "application/x-www-form-urlencoded", HttpHeaders.acceptHeader : "application/json"}),
        data: {'client_id': "your_client_id", 'client_secret': "your_secret_code", 'grant_type': "your_grant_type"});
    final token = response.data['access_token'];
    return token;
  }

}