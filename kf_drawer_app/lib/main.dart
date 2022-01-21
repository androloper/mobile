import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:kf_drawer_app/fifth_page.dart';
import 'package:kf_drawer_app/first_page.dart';
import 'package:kf_drawer_app/fourth_page.dart';
import 'package:kf_drawer_app/second_page.dart';
import 'package:kf_drawer_app/seventh_page.dart';
import 'package:kf_drawer_app/sixth_page.dart';
import 'package:kf_drawer_app/third_page.dart';
import 'class_builder.dart';

void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  late KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('FirstPage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('First Page', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.filter_1, color: Colors.black),
          page: FirstPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Second Page', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.filter_2, color: Colors.black),
          page: SecondPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Third Page', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.filter_3, color: Colors.black),
          page: ThirdPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Fourth Page', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.filter_4, color: Colors.black),
          page: FourthPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Fifth Page', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.filter_5, color: Colors.black),
          page: FifthPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Sixth Page', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.filter_6, color: Colors.black),
          page: SixthPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('SeventhPage', style: TextStyle(color: Colors.black)),
          icon: Icon(Icons.filter_7, color: Colors.black),
          page: SeventhPage(),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
//        borderRadius: 0.0,
//        shadowBorderRadius: 0.0,
       menuPadding: EdgeInsets.only(top:20.0),
//        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.network(
              'https://github.com/qqmikey/kf_drawer/blob/master/example/assets/logo.png?raw=true',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [Colors.white60, Colors.lightGreenAccent],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}