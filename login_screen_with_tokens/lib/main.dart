import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_with_tokens/ui/login_screen.dart';
import 'package:login_screen_with_tokens/ui/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

Future<bool> autoLogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool refreshToken= prefs.containsKey('refreshToken');
  var ref = prefs.getString('refreshToken');
  return refreshToken;
}
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Screen With Tokens',
        theme: CupertinoThemeData(barBackgroundColor: Colors.amberAccent),
        home: const MyHomePage(),
      );
    }
    else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Screen With Tokens',
        theme: ThemeData(
          backgroundColor: Colors.amberAccent,
        ),
        home: const MyHomePage(),
      );
    }
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: "Login Screen With Tokens",
        theme: CupertinoThemeData(
          barBackgroundColor: CupertinoDynamicColor.withBrightness(
              color: CupertinoColors.white,
              darkColor: CupertinoColors.darkBackgroundGray
          ),
          primaryColor: CupertinoColors.white,
          brightness: Brightness.light,
        ),
        home: FutureBuilder<bool>(
          future: autoLogin(),
          builder: (context, snapshot){
            debugPrint(snapshot.data.toString());
            return snapshot.data == true ? WelcomePageScreen() : LoginScreen();
          },
        ),
      );
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login Screen With Tokens',
        home: FutureBuilder<bool>(
          future: autoLogin(),
          builder: (context, snapshot){
            debugPrint(snapshot.data.toString());
            return snapshot.data == true ? WelcomePageScreen() : LoginScreen();
          },
        ),
      );
    }
  }
}