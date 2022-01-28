import 'package:demo_listview_app/production.dart';
import 'package:demo_listview_app/production_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductionScreen extends StatefulWidget {
  const ProductionScreen({Key? key}) : super(key: key);

  @override
  _ProductionScreenState createState() => _ProductionScreenState();
}

class _ProductionScreenState extends State<ProductionScreen> {
  final api = ProductionApi();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Production>>(
      future: api.getProductions(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Production> products = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              top: 12,
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: products.length*100,
                      child: _tile(
                            products[index].tip.toString(),
                            products[index].stokAdBar.toString(),
                            products[index].partiSayisi.toString(),
                            products[index].yuzdeDeger.toString(),
                            products[index].sUMPratikMiktar.toString(),
                            products[index].sUMTeorikMiktar.toString()),
                    ),
                  );
                }),
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Card _tile(
      String tip, String stokAdBar, String partiSayisi, String yuzdeDeger, String sumPratikMiktar, String sumTeorikMiktar ) =>
      Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                child: Text('Tip',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
              ),
              Container(
                width: 150,
                child: Text('StokAdBar',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
              ),
              Container(
                width: 100,
                child: Text('PartiSayisi',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
              ),
              Container(
                width: 100,
                child: Text('YuzdeDeger',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
              ),
              Container(
                width: 150,
                child: Text('Sum_PratikDeger',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
              ),
              Container(
                width: 150,
                child: Text('Sum_TeorikMiktar',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    )),
              ),
            ],
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width:50, child: Text('1',)),
              Container(width:150, child: Text('Location Name')),
              Container(width:100, child: Text('123')),
              Container(width:100, child: Text('%18.6')),
              Container(width:150, child: Text('108')),
              Container(width:150, child: Text('108')),
            ],
          ),
        ),
      );
}