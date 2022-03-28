import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PDFViewerPage extends StatefulWidget {
  final File? file;

  const PDFViewerPage({
    Key? key,
    @required this.file,
  }) : super(key: key);

  @override
  _PDFViewerPageState createState() => _PDFViewerPageState();
}

class _PDFViewerPageState extends State<PDFViewerPage> {
  PDFViewController? controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file!.path);
    if(Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            color: CupertinoColors.white,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            }
          ),
          backgroundColor: CupertinoColors.systemIndigo,
          middle: Text(name,style: TextStyle(color:CupertinoColors.white)),

        ),
        child: PDFView(
          filePath: widget.file!.path,
          // autoSpacing: false,
          // swipeHorizontal: true,
          // pageSnap: false,
          // pageFling: false,
          // nightMode: true,
          onRender: (pages) => setState(() => this.pages = pages!),
          onViewCreated: (controller) =>
              setState(() => this.controller = controller),
          onPageChanged: (indexPage, _) =>
              setState(() => this.indexPage = indexPage!),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.systemIndigo,
        title: Text(name),
      ),
      body: PDFView(
        filePath: widget.file!.path,
        // autoSpacing: false,
        // swipeHorizontal: true,
        // pageSnap: false,
        // pageFling: false,
        // nightMode: true,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }
}