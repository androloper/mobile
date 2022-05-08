import 'dart:io';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:file_picker/file_picker.dart';

class UploadAPI {
  var dio = Dio();

  static Future pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    debugPrint('burasıla' + result.toString());

    if (result == null) return null;
    return result.paths.first!;
  }

  Future uploadPDF(filepath) async {
    try {
      var a = await http.MultipartFile.fromPath('file', filepath);
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://192.168.3.144:7058/api/File/UploadFile'));
      request.files.add(a);
      var res = await request.send();
      return res;
    } catch (e) {
      print(e);
    }
  }

  Future downloadFile() async {
    final response = await http.get(Uri.parse('https://192.168.3.144:7058/api/File/a'));
    return response;
  }

  Future<File> loadNetwork(String url) async {
    final response = await http.get(Uri.parse('https://192.168.3.144:7058/api/File/a'));
    final bytes = response.bodyBytes;

    return _storeFile(url, bytes);
  }

  static Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();

    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }
}
