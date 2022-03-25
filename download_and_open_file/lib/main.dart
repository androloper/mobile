import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Download and Open File'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .1,
                child: ElevatedButton(
                  child: Text('Open Video'),
                  onPressed: () {
                    openFile(
                      url: 'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4',
                      //fileName: 'video.mp4', //for a specific naming
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .1,
                child: ElevatedButton(
                  child: Text('Open Document'),
                  onPressed: () {
                    openFile(
                      url: 'https://file-examples.com/storage/fe298d853a623d0c1a0d0e9/2017/10/file-example_PDF_1MB.pdf',
                      //fileName: 'file.pdf', //for a specific naming
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .1,
                child: ElevatedButton(
                  child: Text('Open Photo'),
                  onPressed: () {
                    openFile(
                      url: 'https://www.gazeteilksayfa.com/d/gallery/331_2.jpg',
                      //fileName: 'photo.jpg', //for a specific naming
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * .8,
                height: MediaQuery.of(context).size.height * .1,
                child: ElevatedButton(
                  child: Text('Pick File & Open'),
                  onPressed: () {
                    lookFile();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final name = fileName ?? url.split('/').last;
    final file = await downloadFile(url, name);
    if(file==null) return;
    debugPrint('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      final file = File('${appStorage.path}/$name');
      final response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    }
    catch (e) {
      return null;
    }
  }

  Future lookFile({String? url, String? fileName}) async {
    // final name = fileName ?? url.split('/').last;
    final file = await pickFile();
    if(file==null) return;
    debugPrint('Path: ${file.path}');
    OpenFile.open(file.path);
  }

  Future<File?> pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if(result == null) return null;
    return File(result.files.first.path!);
  }
}
