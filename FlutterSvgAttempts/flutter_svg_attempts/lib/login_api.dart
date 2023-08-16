import 'dart:convert';

import 'package:flutter_svg_attempts/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginApi{
  static late String user;
  static late String pass;
  static late int userId;
  Future<User> login(username, password) async {
    user = username;
    pass = password;
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username.toString());
    prefs.setString('password', password.toString());
    // var ip = prefs.getString('ip');
    Map<String, String> headers = {};
    headers["Content-Type"] =
    "application/json; charset=UTF-8";
    var data = {"email": '$username', "password": '$password'};
    var parts = [];
    data.forEach((key, value) {
      parts.add('${Uri.encodeQueryComponent(key)}='
          '${Uri.encodeQueryComponent(value)}');
    });
    var formData = parts.join('&');
    final response = await http.get(Uri.parse('/api/Account/Login?$formData'),
        headers: headers);
    // debugPrint(response.body.toString());
    final jsonItems = json.decode(response.body);
    User users = User.fromJson(jsonItems);
    userId = users.id!;
    return users;
  }
}