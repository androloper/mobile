import 'package:notmerkezi/market/models/market_demo.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MarketApis {

  Future<List<MarketDemo>> fetchData() async {
    final response = await http.get(Uri.parse('https://raw.githubusercontent.com/androloper/jsons/main/invoices.json'));
    final jsonItems = json.decode(response.body)['data'];
    List<MarketDemo> totalData = jsonItems.map<MarketDemo>((json) {
      return MarketDemo.fromJson(json);
    }).toList();
    return totalData;
  }
}