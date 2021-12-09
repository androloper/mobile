class Coin {
  String? name;
  String? fullName;
  // double? price;
  // double? change;

  Coin({
    this.name,
    this.fullName,
    // this.price,
    // this.change,
  });


  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      name: json['CoinInfo']['Name'],
      fullName: json['CoinInfo']['FullName'],
      // price: (json['RAW']['USD']['PRICE']).toDouble(),
      // change: (json['RAW']['USD']['CHANGE24HOUR']).toDouble(),
    );
  }
}