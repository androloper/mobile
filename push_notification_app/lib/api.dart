import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Api {
  Future loginComplete(id, token) async {
    id=1;
    token='dhn9TY9LTQea5Tc_MXOSi_:APA91bG4VM1ACyJCQGGvzXs5RQvt3ABp7hC8yyH_NJwiw5BePZWYwk2g0OUiAqxsUIuWN4yef9JiynzZiqfxLAAsBpnjpNZjhPG2MUmX89fhcIW0MO5sPd1MNcVciN0KoDN0nGZwuMgX';
    Map<String, String> headers = {};
    headers["Content-Type"] =
    "application/json; charset=UTF-8";
    final response = await http.get(Uri.parse('http://62.141.44.59:8081/api/Most/LoginComplete?UserId=1&token=dhn9TY9LTQea5Tc_MXOSi_:APA91bG4VM1ACyJCQGGvzXs5RQvt3ABp7hC8yyH_NJwiw5BePZWYwk2g0OUiAqxsUIuWN4yef9JiynzZiqfxLAAsBpnjpNZjhPG2MUmX89fhcIW0MO5sPd1MNcVciN0KoDN0nGZwuMgX'),
        headers: headers);
    debugPrint(response.body.toString());
    // final jsonResp = json.decode(response.body);
    if(response.statusCode != 200) {
      debugPrint(response.statusCode.toString());
    }
    return response.statusCode;
  }
}