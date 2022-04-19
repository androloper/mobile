import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'uploaded_notes_screen.dart';
import 'favorite_notes_screen.dart';
import 'taken_notes_screen.dart';

class NotesScreen extends KFDrawerContent {
  NotesScreen({Key? key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //     child: Container(
    //
    //     )
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.indigo,
        title: Text('Notlarım'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                        child: Text("Aldıklarım",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.03, color:Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => TakenNotesScreen()));
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
                        child: Text("Yüklediklerim",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.03, color:Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => UploadedNotesScreen()));
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
                        child: Text("Favorilerim",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: height*.03, color:Colors.amberAccent)),
                      ),
                      onPressed: () async {
                        Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => FavoriteNotesScreen()));
                      })),
            ),
          ),
        ],
      )
    );
  }
}
