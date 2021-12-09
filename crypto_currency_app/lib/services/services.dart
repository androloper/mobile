import 'dart:convert';
import 'package:crypto_currency_app/models/coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class Services{

  static const int coinNum=100;

  static Future<List<Coin>> getCoins() async{

    String url='https://min-api.cryptocompare.com/data/top/totalvolfull?limit=$coinNum&tsym=USD&page=0';
    List<Coin> coins=[];
    try{
      final response=await http.get(Uri.parse('$url'));
      if (response.statusCode==200){
        Map<String,dynamic> data=json.decode(response.body);
        debugPrint(data.toString());
        List<dynamic> coinList=data['Data'];
        debugPrint(coinList.toString());
        coinList.forEach((json)=>coins.add(Coin.fromJson(json)));
      }
      debugPrint(coins.toString());
      return coins;

    } catch(e){
      throw Exception(e.toString());
    }
  }

}