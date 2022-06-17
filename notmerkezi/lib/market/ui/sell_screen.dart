import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/market_demo.dart';

class SellScreen extends StatefulWidget {
  MarketDemo data;
  SellScreen({required this.data, Key? key}) : super(key: key);

  @override
  State<SellScreen> createState() => _SellScreenState();
}

class _SellScreenState extends State<SellScreen> {
  late TextEditingController priceController;
  var priceFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    priceController = TextEditingController(text: '0');
    super.initState();
  }
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
    var commission = int.parse(priceController.text)==0 ? 0 : int.parse(priceController.text)<=100 ? 25 : int.parse(priceController.text)<=500 ? 125 : int.parse(priceController.text)<=1000 ? 250 : 350;
    var vat = int.parse(priceController.text)==0 ? 0 : int.parse(priceController.text)*.18;
    var total = int.parse(priceController.text)==0 ? 0 : int.parse(priceController.text)-commission-vat;
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.amberAccent,
          title: Text('${widget.data.productName} Sat'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
                    child: Image.asset(
                      'assets/nobg-logo.png',
                      height: height * .2,
                    )),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child:
              Text('Ücret Detaylandırması',
                style: TextStyle(
                    color: Colors.indigo,
                    fontSize: 22,
                    // fontFamily: 'Georgia',
                    fontWeight: FontWeight.w800),
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.indigo,
              thickness: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Ürün Ücreti(₺):',
                    style: TextStyle(
                        fontSize: 20,
                        // fontFamily: 'Georgia',
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: width*.2,
                    height: 30,
                    child: TextFormField(
                      textAlign: TextAlign.right,
                              controller: priceController,
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixStyle: TextStyle(fontWeight: FontWeight.w600),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: Colors.white,
                                filled: true,
                              ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Komisyon: \nK.D.V.: ',
                    style: TextStyle(
                        fontSize: 20,
                        // fontFamily: 'Georgia',
                        fontWeight: FontWeight.w600),
                  ),
                  Text('${commission.toStringAsFixed(2)}₺\n${vat.toStringAsFixed(2)}₺',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 20,
                        // fontFamily: 'Georgia',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Divider(
              indent: 20,
              endIndent: 20,
              color: Colors.indigo,
              thickness: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Ücret:\n(Hesabınıza Geçecek Tutar)',
                    style: TextStyle(
                        fontSize: 20,
                        // fontFamily: 'Georgia',
                        fontWeight: FontWeight.w600),
                  ),
                  Text('${total.toStringAsFixed(2)}₺',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 20,
                        // fontFamily: 'Georgia',
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height*.08,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
              child: SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          primary: Colors.indigo
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                        child: Text("Satışa Koy",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.025, color:Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        try {
                          //api request
                          Navigator.pop(context);
                        } catch(e) {
                          //showDialog
                        }
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => PaymentScreen(totalPrice: total,)));
                      })),
            ),
          ]),
        ));
  }
}
