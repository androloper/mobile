import 'id.dart';

class Author1 {
  Id? name;
  Id? uri;

  Author1({this.name, this.uri});

  Author1.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Id.fromJson(json['name']) : null;
    uri = json['uri'] != null ? Id.fromJson(json['uri']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.uri != null) {
      data['uri'] = this.uri!.toJson();
    }
    return data;
  }
}