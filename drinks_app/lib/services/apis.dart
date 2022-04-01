import 'package:drinks_app/services/url.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/ingredient.dart';

class Apis{
  final url = ApiPages();
  static dynamic drinkByAlcoholicness;
  static Ingredient? ingredientOfDrink;
  static dynamic drinkByCategory;

  Future<Ingredient> fetchIngredient(int id) async {
    var response = await http.get(Uri.parse('${url.ingredient}$id'));
    final ingredient = json.decode(response.body);
    Ingredient recipe = Ingredient.fromJson(ingredient);
    ingredientOfDrink = recipe;
    return recipe;
  }

  Future fetchDrinksByAlcoholicness(String name) async {
    var response = await http.get(Uri.parse('${url.alcoholicness}$name'));
    List<dynamic> drinks = jsonDecode(response.body)["drinks"];
    drinkByAlcoholicness = drinks;
    return drinks;
  }

  Future fetchDrinksByCategory(String name) async {
    var response = await http.get(Uri.parse('${url.category}$name'));
    List<dynamic> drinks = jsonDecode(response.body)["drinks"];
    drinkByCategory = drinks;
    return drinks;
  }
}