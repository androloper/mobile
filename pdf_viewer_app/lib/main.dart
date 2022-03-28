import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf_viewer_app/pdf_api.dart';
import 'package:pdf_viewer_app/pdf_viewer_page.dart';

import 'button_widget.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'PDF Viewer';

  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS){
      return CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: CupertinoThemeData(
          primaryColor: CupertinoColors.systemIndigo,
        ),
        home: MainPage(),
      );
    }

  return MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(
      primaryColor: CupertinoColors.systemIndigo,
    ),
    home: MainPage(),
  );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    if(Platform.isIOS) {
      return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Report PDF', style: TextStyle(color: CupertinoColors.white),),
          backgroundColor: CupertinoColors.systemIndigo,
        ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget(
                    text: 'Local File PDF',
                    onClicked: () async {
                      final file = await PDFApi.pickFile();
                      if (file == null) return;
                      openPDF(context, file);
                    },
                  ),
                  const SizedBox(height: 16),
                  ButtonWidget(
                    text: 'Url PDF',
                    onClicked: () async {
                      const url =
                          'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                      final file = await PDFApi.loadNetwork(url);
                      openPDF(context, file);
                    },
                  ),
                ],
              ),
            ),
          ),
      );
    }
  return Scaffold(
    appBar: AppBar(
      backgroundColor: CupertinoColors.systemIndigo,
      title: Text('Report PDF'),
    ),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonWidget(
              text: 'Local File PDF',
              onClicked: () async {
                final file = await PDFApi.pickFile();
                if (file == null) return;
                openPDF(context, file);
              },
            ),
            const SizedBox(height: 16),
            ButtonWidget(
              text: 'Url PDF',
              onClicked: () async {
                const url =
                    'https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf';
                final file = await PDFApi.loadNetwork(url);
                openPDF(context, file);
              },
            ),
          ],
        ),
      ),
    ),
  );
}

  void openPDF(BuildContext context, File file) {
    if(Platform.isIOS){
      Navigator.of(context).push(
        CupertinoPageRoute(builder: (context) => PDFViewerPage(file: file)));
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)));
  }
}