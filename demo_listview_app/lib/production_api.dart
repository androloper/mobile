import 'dart:convert';
import 'package:demo_listview_app/production.dart';
import 'package:demo_listview_app/production_pages.dart';
import 'package:http/http.dart' as http;

class ProductionApi {
  final page = ProductionPages();
  Future<List<Production>> getProductions() async {
    final response = await http.get(Uri.parse(page.Top10Uretim));
    dynamic jsonItems = json.decode(response.body);
    List<Production> productionList = jsonItems.map<Production>((json) {
      return Production.fromJson(json);
    }).toList();
    return productionList;
  }

}