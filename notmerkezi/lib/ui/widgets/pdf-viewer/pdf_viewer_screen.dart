import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path/path.dart';

class PdfViewerScreen extends StatefulWidget {
  final File? file;
  const PdfViewerScreen({@required this.file, Key? key}) : super(key: key);

  @override
  _PdfViewerScreenState createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  PDFViewController? controller;
  int pages = 0;
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    final name = basename(widget.file!.path);
    if(Platform.isIOS){
      return CupertinoPageScaffold(
        // navigationBar: CupertinoNavigationBar(
        //   leading: const CupertinoNavigationBarBackButton(
        //     color: CupertinoColors.white,
        //   ),
        //   middle: Text(name, style: const TextStyle(color:CupertinoColors.white)),
        //   backgroundColor: Colors.indigo,
        //   trailing: pages>=2 ? Row(
        //     mainAxisAlignment: MainAxisAlignment.end,
        //     mainAxisSize: MainAxisSize.min,
        //     children: [
        //       CupertinoButton(
        //         padding: const EdgeInsets.all(0),
        //         child: const Icon(Icons.west,
        //           size: 24,
        //           color: CupertinoColors.white
        //         ),
        //         onPressed: () {
        //           final page = indexPage == pages ? pages : indexPage - 1;
        //           controller!.setPage(page);
        //         },
        //       ),
        //       CupertinoButton(
        //         padding: const EdgeInsets.all(0),
        //         child: const Icon(Icons.east,
        //           size: 24,
        //           color: CupertinoColors.white
        //         ),
        //         onPressed: () {
        //           final page = indexPage == pages - 1 ? pages : indexPage + 1;
        //           controller!.setPage(page);
        //         },
        //       ),
        //     ],
        //   ) : null,
        // ),
        child: PDFView(
          filePath: widget.file!.path,
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
        backgroundColor: Colors.indigo,
        title: Text(name),
        actions: pages >= 2
            ? [
          IconButton(
            icon: const Icon(Icons.chevron_left, size: 32),
            onPressed: () {
              final page = indexPage == pages ? pages : indexPage - 1;
              controller!.setPage(page);
            },
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right, size: 32),
            onPressed: () {
              final page = indexPage == pages - 1 ? pages : indexPage + 1;
              controller!.setPage(page);
            },
          ),
        ]
            : null,
      ),
      body: PDFView(
        filePath: widget.file!.path,
        onRender: (pages) => setState(() => this.pages = pages!),
        onViewCreated: (controller) =>
            setState(() => this.controller = controller),
        onPageChanged: (indexPage, _) =>
            setState(() => this.indexPage = indexPage!),
      ),
    );
  }

}