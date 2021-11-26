import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Trailer {
  String id;
  String iso_639_1;
  String iso_3166_1;
  String key;
  String name;
  String site;
  int size;
  String type;
  Trailer(this.id, this.iso_639_1, this.iso_3166_1, this.key, this.name,
      this.site, this.size, this.type);

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
        json['id'] as String,
        json['iso_639_1'] as String,
        json['iso_3166_1'] as String,
        json['key'] as String,
        json['name'] as String,
        json['site'] as String,
        json['size'] as int,
        json['type'] as String);
  }

  Map<String, dynamic> toJson(Trailer instance) => {
    'id': instance.id,
    'iso_639_1': instance.iso_639_1,
    'iso_3166_1': instance.iso_3166_1,
    'key': instance.key,
    'name': instance.name,
    'site': instance.site,
    'size': instance.size,
    'type': instance.type
  };
}