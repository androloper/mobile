import 'id.dart';

class Author {
  Id? name;
  Id? uri;
  Id? email;

  Author({this.name, this.uri, this.email});

  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Id.fromJson(json['name']) : null;
    uri = json['uri'] != null ? Id.fromJson(json['uri']) : null;
    email = json['email'] != null ? Id.fromJson(json['email']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name!.toJson();
    }
    if (this.uri != null) {
      data['uri'] = this.uri!.toJson();
    }
    if (this.email != null) {
      data['email'] = this.email!.toJson();
    }
    return data;
  }
}