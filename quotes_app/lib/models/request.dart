import 'success.dart';
import 'contents.dart';
import 'copyright.dart';

class Request {
  Success? success;
  Contents? contents;
  String? baseurl;
  Copyright? copyright;

  Request({this.success, this.contents, this.baseurl, this.copyright});

  Request.fromJson(Map<String, dynamic> json) {
    success =
    json['success'] != null ? new Success.fromJson(json['success']) : null;
    contents = json['contents'] != null
        ? new Contents.fromJson(json['contents'])
        : null;
    baseurl = json['baseurl'];
    copyright = json['copyright'] != null
        ? new Copyright.fromJson(json['copyright'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.success != null) {
      data['success'] = this.success!.toJson();
    }
    if (this.contents != null) {
      data['contents'] = this.contents!.toJson();
    }
    data['baseurl'] = this.baseurl;
    if (this.copyright != null) {
      data['copyright'] = this.copyright!.toJson();
    }
    return data;
  }
}