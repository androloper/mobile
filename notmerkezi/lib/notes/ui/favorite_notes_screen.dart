import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteNotesScreen extends StatefulWidget {
  const FavoriteNotesScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteNotesScreen> createState() => _FavoriteNotesScreenState();
}

class _FavoriteNotesScreenState extends State<FavoriteNotesScreen> {
  @override
  Widget build(BuildContext context) {
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //       child: Container(
    //
    //     )
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.indigo,
        title: Text('Favorilediğim Notlar'),
      ),
      body: Container(

      )
    );
  }
}
