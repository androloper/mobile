import 'dart:io';
import 'package:flutter/material.dart';
import 'package:notmerkezi/market/services/market_api.dart';
import 'package:notmerkezi/ui/widgets/kf-drawer/class_builder.dart';
import 'package:notmerkezi/ui/widgets/kf-drawer/main_widget.dart';
import 'package:notmerkezi/ui/widgets/loading/loading_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'account/ui/login_screen.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  int ctr = 0;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Not Merkezi',
      // home: LoginScreen(),
      home: FutureBuilder<bool>(
        future: autoLogin(),
        builder: (context, snapshot){
          if(snapshot.data == null) {
            ctr++;
            if(ctr>1) {
              return LoginScreen();
            }
            else {
              return LoadingScreen();
            }
          }
          return snapshot.data == true ? MainWidget() : LoginScreen();
        },
      ),
    );
  }

  Future<bool> autoLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var pwd = prefs.getString('password');
    // await LoginApi().login(user, pwd);
    // debugPrint(account.toString());
    bool acc = prefs.containsKey('userInfo');
    return acc;
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
