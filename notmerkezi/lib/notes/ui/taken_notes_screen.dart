import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TakenNotesScreen extends StatefulWidget {
  const TakenNotesScreen({Key? key}) : super(key: key);

  @override
  State<TakenNotesScreen> createState() => _TakenNotesScreenState();
}

class _TakenNotesScreenState extends State<TakenNotesScreen> {
  @override
  Widget build(BuildContext context) {
    // if(Platform.isIOS){
    //   return CupertinoPageScaffold(
    //     child: Container(
    //
    //     ),
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        title: Text('Aldığım Notlar'),
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.indigo,
      ),
      body: Container(

      ),
    );
  }
}
