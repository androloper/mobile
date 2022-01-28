import 'package:demo_listview_app/production_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductionScreen()
    );
  }
}

/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter ListView - googleflutter.com'),
        ),
        body: Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 200,
                color: Colors.purple[600],
                child: const Center(child: Text('Item 1', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
              Container(
                width: 200,
                color: Colors.purple[500],
                child: const Center(child: Text('Item 2', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
              Container(
                width: 200,
                color: Colors.purple[400],
                child: const Center(child: Text('Item 3', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
              Container(
                width: 200,
                color: Colors.purple[300],
                child: const Center(child: Text('Item 4', style: TextStyle(fontSize: 18, color: Colors.white),)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 */
