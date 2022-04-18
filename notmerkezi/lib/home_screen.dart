import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:notmerkezi/account/models/account.dart';
import 'package:notmerkezi/market/ui/market_screen.dart';
import 'package:notmerkezi/notes/ui/notes_screen.dart';
import 'package:notmerkezi/settings/settings_screen.dart';

import 'account/ui/account_screen.dart';

class HomeScreen extends KFDrawerContent {
  HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Account acc = Account();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    acc.id = 1;
    acc.fullName = 'Ramazan Baybörek';
    acc.birthDate = '10/03/1997';
    acc.phoneNo = '5060526793';
    acc.university = 'İzmir Ekonomi Üniversitesi';
    acc.department = 'Yazılım Mühendisliği';
    acc.studentNo = '20170601042';
    // if (Platform.isIOS) {
    //   return CupertinoPageScaffold(
    //     backgroundColor: Colors.grey,
    //     child: Column(
    //       children: [
    //         Expanded(
    //           flex: 3,
    //           child: Stack(
    //             children: <Widget>[
    //               Container(
    //                 color: Colors.indigoAccent,
    //                 height: 40,
    //               ),
    //               Container(
    //                 decoration: BoxDecoration(
    //                   borderRadius: BorderRadius.circular(35),
    //                   color: Colors.indigoAccent,
    //                 ),
    //                 child: Padding(
    //                   padding: const EdgeInsets.only(top: 30),
    //                   child: SizedBox(
    //                     child: Stack(
    //                       children: <Widget>[
    //                         Center(
    //                           child: Container(
    //                             width: width * 0.6,
    //                             height: height * 0.2,
    //                             child: CircularProgressIndicator(
    //                               strokeWidth: 4,
    //                               backgroundColor: Colors.amberAccent,
    //                               color: Colors.grey,
    //                             ),
    //                           ),
    //                         ),
    //                         Center(
    //                             child: Image.asset(
    //                               'assets/notes.jpg',
    //                               width: width * 0.45,
    //                             )),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //         Expanded(
    //           flex: 5,
    //           child: Container(
    //             margin: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 30.0),
    //             child: GridView(
    //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //                   crossAxisCount: 2,
    //                   mainAxisSpacing: 40,
    //                   crossAxisSpacing: 30),
    //               children: [
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.rectangle,
    //                     border: Border.all(
    //                       color: Colors.amberAccent,
    //                       width: 5,
    //                     ),
    //                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                   ),
    //                   child: SizedBox(
    //                       child: ElevatedButton(
    //                           style: ButtonStyle(
    //                               backgroundColor:
    //                               MaterialStateProperty.all<Color>(
    //                                   Colors.indigoAccent)),
    //                           child: Column(
    //                             children: [
    //                               Padding(
    //                                 padding: const EdgeInsets.only(top: 30.0),
    //                                 child: Icon(Icons.business, size: 80, color: Colors.amberAccent,),
    //                               ),
    //                               Text(
    //                                 "Not Marketi",
    //                                 style: TextStyle(
    //                                     fontSize: 18.0, color: CupertinoColors.black),
    //                               ),
    //                             ],
    //                           ),
    //                           onPressed: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CupertinoPageRoute(
    //                                     builder: (context) => MarketScreen()));
    //                           })),
    //                 ),
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.rectangle,
    //                     border: Border.all(
    //                       color: Colors.amberAccent,
    //                       width: 5,
    //                     ),
    //                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                   ),
    //                   child: SizedBox(
    //                       child: ElevatedButton(
    //                           style: ButtonStyle(
    //                               backgroundColor:
    //                               MaterialStateProperty.all<Color>(
    //                                   Colors.indigoAccent)),
    //                           child: Column(
    //                             children: [
    //                               Padding(
    //                                 padding: const EdgeInsets.only(top: 30.0),
    //                                 child: Icon(Icons.insert_drive_file, size: 80, color: Colors.amberAccent,),
    //                               ),
    //                               Text(
    //                                 "Notlarım",
    //                                 style: TextStyle(
    //                                     fontSize: 18.0, color: CupertinoColors.black),
    //                               ),
    //                             ],
    //                           ),
    //                           onPressed: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CupertinoPageRoute(
    //                                     builder: (context) => NotesScreen()));
    //                           })),
    //                 ),
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.rectangle,
    //                     border: Border.all(
    //                       color: Colors.amberAccent,
    //                       width: 5,
    //                     ),
    //                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                   ),
    //                   child: SizedBox(
    //                       child: ElevatedButton(
    //                           style: ButtonStyle(
    //                               backgroundColor:
    //                               MaterialStateProperty.all<Color>(
    //                                   Colors.indigoAccent)),
    //                           child: Column(
    //                             children: [
    //                               Padding(
    //                                 padding: const EdgeInsets.only(top: 30.0),
    //                                 child: Icon(Icons.list, size: 80, color: Colors.amberAccent,),
    //                               ),
    //                               Text(
    //                                 "Hesabım",
    //                                 style: TextStyle(
    //                                     fontSize: 18.0, color: CupertinoColors.black),
    //                               ),
    //                             ],
    //                           ),
    //                           onPressed: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CupertinoPageRoute(
    //                                     builder: (context) => AccountScreen()));
    //                           })),
    //                 ),
    //                 Container(
    //                   decoration: BoxDecoration(
    //                     shape: BoxShape.rectangle,
    //                     border: Border.all(
    //                       color: Colors.amberAccent,
    //                       width: 5,
    //                     ),
    //                     borderRadius: BorderRadius.all(Radius.circular(10.0)),
    //                   ),
    //                   child: SizedBox(
    //                       child: ElevatedButton(
    //                           style: ButtonStyle(
    //                               backgroundColor:
    //                               MaterialStateProperty.all<Color>(
    //                                   Colors.indigoAccent)),
    //                           child: Column(
    //                             children: [
    //                               Padding(
    //                                 padding: const EdgeInsets.only(top: 30.0),
    //                                 child: Icon(Icons.contact_page_outlined, size: 80, color: Colors.amberAccent,),
    //                               ),
    //                               Text(
    //                                 "Ayarlar",
    //                                 style: TextStyle(
    //                                     fontSize: 18.0, color: CupertinoColors.black),
    //                               ),
    //                             ],
    //                           ),
    //                           onPressed: () {
    //                             Navigator.push(
    //                                 context,
    //                                 CupertinoPageRoute(
    //                                     builder: (context) => SettingsScreen()));
    //                           })),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.indigoAccent,
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.indigoAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: SizedBox(
                      child: Stack(
                        children: <Widget>[
                          Center(
                            child: Container(
                              width: width * 0.6,
                              height: height * 0.25,
                              child: CircularProgressIndicator(
                                strokeWidth: 4,
                                backgroundColor: Colors.amberAccent,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          Center(
                              child: Image.asset(
                                'assets/nobg-logo.png',
                                width: width * 0.45,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: SizedBox(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.indigoAccent)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Icon(Icons.business, size: 80, color: Colors.amberAccent,),
                                ),
                                Text(
                                  "Not Marketi",
                                  style: TextStyle(
                                      fontSize: 18.0, color: CupertinoColors.black),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MarketScreen()));
                            })),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: SizedBox(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.indigoAccent)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Icon(Icons.insert_drive_file, size: 80, color: Colors.amberAccent,),
                                ),
                                Text(
                                  "Notlarım",
                                  style: TextStyle(
                                      fontSize: 18.0, color: CupertinoColors.black),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NotesScreen()));
                            })),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: SizedBox(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.indigoAccent)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Icon(Icons.list, size: 80, color: Colors.amberAccent,),
                                ),
                                Text(
                                  "Hesabım",
                                  style: TextStyle(
                                      fontSize: 18.0, color: CupertinoColors.black),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountScreen(account: acc,)));
                            })),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      border: Border.all(
                        color: Colors.amberAccent,
                        width: 5,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: SizedBox(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.indigoAccent)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Icon(Icons.contact_page_outlined, size: 80, color: Colors.amberAccent,),
                                ),
                                Text(
                                  "Ayarlar",
                                  style: TextStyle(
                                      fontSize: 18.0, color: CupertinoColors.black),
                                ),
                              ],
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SettingsScreen()));
                            })),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}