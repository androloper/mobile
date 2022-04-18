import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    if(Platform.isIOS){
      return CupertinoPageScaffold(
        backgroundColor: Colors.grey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: SizedBox(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Container(
                      width: width*.9,
                      height: height*.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Center(child: Icon(Icons.code, color: Colors.indigo, size: height*.35,)),
                          Text('Yakında uygulamamız üzerinden erişebileceksiniz.',style: TextStyle(fontSize: 16, color: Colors.indigo),),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SizedBox(
                              width: width*.9,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Geri Dön",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: SizedBox(
          child: Stack(
            children: <Widget>[
              Center(
                child: Container(
                    width: width*.9,
                    height: height*.7,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(child: Icon(Icons.code, color: Colors.indigo, size: height*.35,)),
                        Text('Yakında uygulamamız üzerinden erişebileceksiniz.',style: TextStyle(fontSize: 16, color: Colors.indigo),),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SizedBox(
                            width: width*.9,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.indigo)),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Geri Dön",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
