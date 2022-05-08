import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notmerkezi/ui/widgets/pdf-viewer/pdf_viewer_screen.dart';

import '../services/upload_api.dart';

class NoteUploadScreen extends StatefulWidget {
  NoteUploadScreen({Key? key}) : super(key: key);

  @override
  State<NoteUploadScreen> createState() => _NoteUploadScreenState();
}

class _NoteUploadScreenState extends State<NoteUploadScreen> {
  @override
  Widget build(BuildContext context) {
    // if(Platform.isIOS) {
    //   return CupertinoPageScaffold(
    //       child: Container(
    //
    //       )
    //   );
    // }
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.amberAccent,
        backgroundColor: Colors.indigo,
        title: Text('Dosya Yükleme'),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        child: Center(
          child: ElevatedButton(
            child: Text('Dosya Yükle'),
            onPressed: () async {
              // var a = await UploadAPI.pickFile();
              // var b = await UploadAPI().uploadPDF(a);
              final file = await UploadAPI().loadNetwork('https://192.168.3.144:7058/api/File/asikarti');
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PdfViewerScreen(file: file)));
              },
          ),
        ),
      ),
    );
  }
}
