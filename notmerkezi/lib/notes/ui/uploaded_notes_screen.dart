import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UploadedNotesScreen extends StatefulWidget {
  const UploadedNotesScreen({Key? key}) : super(key: key);

  @override
  State<UploadedNotesScreen> createState() => _UploadedNotesScreenState();
}

class _UploadedNotesScreenState extends State<UploadedNotesScreen> {
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
        title: Text('Yüklediğim Notlar'),
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.indigo,
      ),
      body: Container(

      ),
    );
  }
}
