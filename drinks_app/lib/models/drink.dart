class Drink {
  String? strDrink;
  String? strDrinkThumb;
  String? idDrink;

  Drink({this.strDrink, this.strDrinkThumb, this.idDrink});

  Drink.fromJson(Map<String, dynamic> json) {
    strDrink = json['strDrink'];
    strDrinkThumb = json['strDrinkThumb'];
    idDrink = json['idDrink'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['strDrink'] = this.strDrink;
    data['strDrinkThumb'] = this.strDrinkThumb;
    data['idDrink'] = this.idDrink;
    return data;
  }
}