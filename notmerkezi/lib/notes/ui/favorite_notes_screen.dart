import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notmerkezi/market/services/market_api.dart';

import '../../market/models/market_demo.dart';
import '../../market/ui/buy_screen.dart';
import '../../ui/widgets/loading/loading_screen.dart';
import '../../ui/widgets/pdf-viewer/pdf_api.dart';
import '../../ui/widgets/pdf-viewer/pdf_viewer_screen.dart';

class FavoriteNotesScreen extends StatefulWidget {
  const FavoriteNotesScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteNotesScreen> createState() => _FavoriteNotesScreenState();
}

class _FavoriteNotesScreenState extends State<FavoriteNotesScreen> {
  final api = MarketApis();
  @override
  Widget build(BuildContext context) {
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //       child: Container(
    //
    //     )
    //   );
    // }
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.amberAccent,
          title: Text('Favorilediğim Notlar'),
        ),
        body: FutureBuilder<List<MarketDemo>>(
            future: api.fetchData(),
            builder: (context, snapshot) {
              if(snapshot.hasData) {
                final notes = snapshot.data!;

                return ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 16),
                        color: Colors.amberAccent,
                        child: Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: [
                            IconSlideAction(
                              caption: "İncele",
                              color: Colors.deepPurpleAccent,
                              foregroundColor: Colors.white,
                              icon: Icons.picture_as_pdf,
                              onTap: () async {
                                // final file = await PDFApi.loadNetwork(reports[index].pdfUrl);
                                const url =
                                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                                final file = await PDFApi.loadNetwork(url);
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewerScreen(file: file)));
                              },
                            ),
                            IconSlideAction(
                              caption: "Satın Al",
                              color: Colors.greenAccent,
                              foregroundColor: Colors.black,
                              icon: Icons.account_balance_wallet_outlined,
                              onTap: () async {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => BuyScreen(data: notes[index],)));
                              },
                            ),
                            IconSlideAction(
                              caption: "Sil",
                              color: Colors.redAccent,
                              foregroundColor: Colors.black,
                              icon: Icons.delete_outline_outlined,
                              onTap: () async {
                                // Navigator.push(context, CupertinoPageRoute(builder: (context) => SpecificProductionScreen(locId: widget.location.id,)));
                              },
                            ),
                          ],
                          child:  ListTile(
                            contentPadding: const EdgeInsets.all(16),
                            leading: CircleAvatar(
                              backgroundColor: Colors.indigo,
                              foregroundColor: Colors.amberAccent,
                              child: Text('${notes[index].productID}'),
                            ),
                            title: Text(
                              "${notes[index].productName}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 20),
                            ),
                            subtitle: Text(
                              "${notes[index].customerName}",
                              textAlign: TextAlign.start,
                              style: const TextStyle(fontSize: 16),
                            ),
                            trailing: Container(
                              color: Colors.indigo,
                              width: 100,
                              height: 100,
                              child: Center(
                                child: Text(
                                  "${notes[index].extendedPrice}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontSize: 16, color: Colors.amberAccent),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
              else if(snapshot.data==null){
                return Center(
                  child: Text('Not Bulunamadı.', style: TextStyle(fontSize: 16, color: Colors.indigo)),
                );
              }
              return LoadingScreen();
            }
        )
    );
  }
}
