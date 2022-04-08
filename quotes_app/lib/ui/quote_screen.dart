import 'package:flutter/material.dart';
import 'package:quotes_app/services/api.dart';
import '../models/quotes.dart';

class QuoteScreen extends StatefulWidget {
  String? name;
  QuoteScreen({required this.name, Key? key}) : super(key: key);

  @override
  State<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends State<QuoteScreen> {
  final List<Quotes> quote = Api.quoteOfTheDay;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.name!),
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.indigoAccent,
      ),
      body: Center(
        child: Container(
          width: width*.8,
          height: height*.6,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.network(quote[0].background.toString(), height: height*.2,),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Text('" ${quote[0].quote} "', style: TextStyle(fontStyle: FontStyle.italic, fontSize: width*.04),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          children: [
                            Text('- ${quote[0].author}', style: TextStyle(fontWeight: FontWeight.w700, fontSize: width*.05),),
                            SizedBox(width: width*.2,)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].category!.toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ),
                          quote[0].tags![0].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![0].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),
                          quote[0].tags![1].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![1].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),
                          quote[0].tags![2].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![2].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),
                          quote[0].tags![3].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![3].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),
                          quote[0].tags![4].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![4].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),
                          quote[0].tags![5].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![5].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),
                          quote[0].tags![6].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![6].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),
                          quote[0].tags![7].isNotEmpty ? FilterChip(
                            backgroundColor: Colors.indigoAccent,
                            label: Text(quote[0].tags![7].toUpperCase(),
                              style: TextStyle(color: Colors.white),),
                            onSelected: (b) {},
                          ) : Container(),

                        ],
                      ),
                    ],
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
