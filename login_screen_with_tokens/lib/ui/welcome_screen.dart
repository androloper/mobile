import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class WelcomePageScreen extends StatelessWidget {
  WelcomePageScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(Icons.logout),
            onPressed: () async{
              var prefs = await SharedPreferences.getInstance();
              prefs.remove('accessToken');
              prefs.remove('refreshToken');
              Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => LoginScreen()));
            },
          ),
          middle: Text(
            "Welcome Page Screen",
            style: TextStyle(color: Colors.grey),
          ),
          backgroundColor: Colors.amberAccent,
        ),
        child: Center(
          child: Text('Frontends Union\nInstagram: @frontendsunion', style: TextStyle(fontSize: 20),),
        )
      );
    }
    // ANDROID
    else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          actions: [
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () async{
                var prefs = await SharedPreferences.getInstance();
                prefs.remove('accessToken');
                prefs.remove('refreshToken');
                Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => LoginScreen()));
              },
            )
          ],
          title: Text("Welcome Page Screen"),
        ),
        body: Center(
          child: Text('Frontends Union\nInstagram: @frontendsunion', style: TextStyle(fontSize: 20),),
        )
      );
    }
  }
}
