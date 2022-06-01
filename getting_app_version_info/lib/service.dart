import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'version.dart';

class Service {
  final baseUrl = 'https://raw.githubusercontent.com/androloper/jsons/main/app-versions.json';

  Future<Version> fetchVersions() async {
    final response = await http.get(Uri.parse(baseUrl));
    final jsonItems = jsonDecode(response.body);
    debugPrint(jsonItems[0].toString());
    Version versions = Version.fromJson(jsonItems[0]);
    return versions;
  }
}