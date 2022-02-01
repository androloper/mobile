import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp( MyApp());
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
      home: CheckBoxListTileDemo(),
    );
  }
}

class CheckBoxListTileDemo extends StatefulWidget {
  @override
  CheckBoxListTileDemoState createState() => new CheckBoxListTileDemoState();
}

class CheckBoxListTileDemoState extends State<CheckBoxListTileDemo> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
  CheckBoxListTileModel.getUsers();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: new Text(
          'CheckBox ListTile App',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: new ListView.builder(
          itemCount: checkBoxListTileModel.length,
          itemBuilder: (BuildContext context, int index) {
            return new Card(
              child: new Container(
                padding: new EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    new CheckboxListTile(
                        activeColor: Colors.pink[300],
                        dense: true,
                        //font change
                        title: new Text(
                          '${checkBoxListTileModel[index].title}',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        value: checkBoxListTileModel[index].isCheck,
                        secondary: Container(
                          height: 50,
                          width: 50,
                          child: Image.network(
                            '${checkBoxListTileModel[index].img}',
                            fit: BoxFit.cover,
                          ),
                        ),
                        onChanged: (bool? val) {
                          itemChange(val!, index);
                        })
                  ],
                ),
              ),
            );
          }),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}
class CheckBoxListTileModel {
  int? userId;
  String? img;
  String? title;
  bool? isCheck;

  CheckBoxListTileModel({this.userId, this.img, this.title, this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(
          userId: 1,
          img: 'https://img2.pngindir.com/20180520/shq/kisspng-android-logo-5b01dfc543cb75.2302463715268494772777.jpg',
          title: "Android",
          isCheck: true),
      CheckBoxListTileModel(
          userId: 2,
          img: 'https://cdn.dribbble.com/users/1622791/screenshots/11174104/flutter_intro.png',
          title: "Flutter",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 3,
          img: 'https://usercontent.one/wp/www.huseyinturkmen.com/wp-content/uploads/2021/02/ios.png',
          title: "IOS",
          isCheck: false),
      CheckBoxListTileModel(
          userId: 4,
          img: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7u-Ov-Vmlk9gIzrfCdqUIJgmgjFka0TFCKH6rEnmXrwS7OL5aJsVw8v4j1KxNAAFA6h4&usqp=CAU',
          title: "Node",
          isCheck: false),
    ];
  }
}