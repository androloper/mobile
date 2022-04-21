import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:notmerkezi/account/ui/login_screen.dart';
import 'package:notmerkezi/market/services/market_api.dart';
import 'package:notmerkezi/settings/about_us_screen.dart';
import 'package:notmerkezi/settings/support_screen.dart';
import 'package:notmerkezi/settings/wallet_screen.dart';
import '../account/models/login.dart';
import 'change_password_screen.dart';

class SettingsScreen extends KFDrawerContent {
  SettingsScreen({Key? key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Login credentials= Login();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    credentials.email = 'ramazanbayborek@gmail.com';
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //     navigationBar: CupertinoNavigationBar(
    //       backgroundColor: Colors.indigo,
    //       middle: Text('Ayarlar', style: TextStyle(color: Colors.amberAccent)),
    //     ),
    //     child: Container(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //
    //         ],
    //       ),
    //     ),
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.amberAccent,
        title: Text('Ayarlar'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: Colors.indigo
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Text("Şifremi Değiştir",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: height*.03, color: Colors.amberAccent)),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ChangePasswordScreen(credentials: credentials,)));
                        })),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: Colors.indigo
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Text("Cüzdan",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: height*.03, color: Colors.amberAccent)),
                        ),
                        onPressed: () async {
                          //api request for previous transactions
                          MarketApis().fetchData();
                          Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => WalletScreen()));
                        })),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: Colors.indigo
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Text("Hakkımızda",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: height*.03, color: Colors.amberAccent)),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AboutUsScreen()));
                        })),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: Colors.indigo
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Text("Destek",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: height*.03, color: Colors.amberAccent)),
                        ),
                        onPressed: () async {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SupportScreen()));
                        })),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.fromLTRB(24, 12, 24, 6),
                child: SizedBox(
                    width: width,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            primary: Colors.indigo
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                          child: Text("Çıkış Yap",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: height*.03, color: Colors.amberAccent)),
                        ),
                        onPressed: () async {
                          //api request for logout
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()));
                        })),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
