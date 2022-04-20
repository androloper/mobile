import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notmerkezi/market/models/market_demo.dart';
import 'package:notmerkezi/market/ui/payment_screen.dart';

class BuyScreen extends StatefulWidget {
  MarketDemo data;
  BuyScreen({required this.data, Key? key}) : super(key: key);

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
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
    var commission = widget.data.extendedPrice!<=100 ? 20 : widget.data.extendedPrice!<=500 ? 50 : 100;
    var vat = (widget.data.extendedPrice! + commission)*.18;
    var total = widget.data.extendedPrice!+commission+vat;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.amberAccent,
        title: Text('${widget.data.productName} Satın Al'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // SizedBox(
            //   height: height*.08,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/nobg-logo.png', width: width*.4,),
                    Text('Not Id: \nSatıcı Id: \nÜcret: ',
                      style: TextStyle(
                          fontSize: 20,
                          // fontFamily: 'Georgia',
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Text('${widget.data.productID}\n${widget.data.customerID}\n${widget.data.extendedPrice!.toStringAsFixed(2)}₺',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 20,
                        // fontFamily: 'Georgia',
                        fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
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
                  Text('Ürün Ücreti: \nKomisyon: \nK.D.V.: ',
                    style: TextStyle(
                        fontSize: 20,
                        // fontFamily: 'Georgia',
                        fontWeight: FontWeight.w600),
                  ),
                  Text('${widget.data.extendedPrice!.toStringAsFixed(2)}₺\n${commission.toStringAsFixed(2)}₺\n${vat.toStringAsFixed(2)}₺',
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
                  Text('Total Ücret:',
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
                        child: Text("Ödeme Ekranına İlerle",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.025, color:Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen(totalPrice: total,)));
                      })),
            ),
          ],
      ),
    );
  }
}
