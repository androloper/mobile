import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:quotes_app/models/quotes.dart';

class Api {
  static String apiUrl = 'https://quotes.rest/qod';
  static dynamic quoteOfTheDay;

  Future todaysQuote() async {
    var response = await http.get(Uri.parse('$apiUrl'));
    final jsonItems = json.decode(response.body)["contents"]["quotes"];
    List<Quotes> quote = jsonItems.map<Quotes>((json) {
      return Quotes.fromJson(json);
    }).toList();
    quoteOfTheDay = quote;
    return quote;
  }

  Future todaysQuoteOfCategory(String name) async {
    var response = await http.get(Uri.parse('$apiUrl?category=$name'));
    final jsonItems = json.decode(response.body)["contents"]["quotes"];
    List<Quotes> quote = jsonItems.map<Quotes>((json) {
      return Quotes.fromJson(json);
    }).toList();
    quoteOfTheDay = quote;
    return quote;
  }
}