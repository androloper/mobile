import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:notmerkezi/market/models/market_demo.dart';
import 'package:notmerkezi/market/services/market_api.dart';

class WalletScreen extends KFDrawerContent {
   WalletScreen({Key? key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  var formKey = GlobalKey<FormState>();
  var ibanController = TextEditingController();
  var moneyController = TextEditingController();
  List<MarketDemo>? notes = MarketApis.demoData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //     child: Container(
    //
    //     ),
    //   );
    // }
    var potentialMoney = notes!.where((element) => element.customerID=='ALFKI');
    double sumMaxPrice = 0;
    for (var i = 0; i < potentialMoney.length; i++) {
      sumMaxPrice += potentialMoney.toList()[i].extendedPrice!;
    }
    // var maxPrice = potentialMoney.toList()
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.amberAccent,
          title: Text('Cüzdan')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 32,
              top: height * 0.1,
              right: 32,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16,16,16,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Bakiye:',
                          style: TextStyle(
                              fontSize: 20,
                              // fontFamily: 'Georgia',
                              fontWeight: FontWeight.w600),
                        ),
                        Text('${sumMaxPrice.toStringAsFixed(2)}₺',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 20,
                              // fontFamily: 'Georgia',
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextFormField(
                      controller: ibanController,
                      enabled: true,
                      decoration: InputDecoration(
                        prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                        labelText: "IBAN",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: TextFormField(
                      controller: moneyController,
                      decoration: InputDecoration(
                        prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                        labelText: "Çekilecek Tutar",
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                      obscureText: true,
                      onFieldSubmitted: (value) {}, // lazım olur
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                        width: width * .6,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                primary: Colors.indigo),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(24, 16, 24, 16),
                              child: Text("Para Çekme",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.amberAccent)),
                            ),
                            onPressed: () async {
                              //api request
                            })),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top:16),
            height: height*.43,
            child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 32),
                itemCount: potentialMoney.length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.amberAccent,
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: SizedBox(
                        width: width*.25,
                        child: Text('${potentialMoney.toList()[index].orderDate}'),
                      ),
                      title: Text(
                        "${potentialMoney.toList()[index].productName}",
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 16),
                      ),
                      trailing: Text(
                            "${potentialMoney.toList()[index].extendedPrice}",
                            textAlign: TextAlign.end,
                            style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
