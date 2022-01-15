import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:simple_cubit_project/data/models/user.dart';

class Api {
  final baseUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(Uri.parse(baseUrl));
    final jsonItems = json.decode(response.body);
    List<User> userList = jsonItems.map<User>((json) {
      return User.fromJson(json);
    }).toList();
    return userList;
  }

  Future fetchUserInfo(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/$id'));
    final jsonItem = json.decode(response.body);
    return jsonItem;
  }
}
