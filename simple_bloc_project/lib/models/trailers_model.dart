import 'package:json_annotation/json_annotation.dart';
import 'package:simple_bloc_project/models/trailer_model.dart';

@JsonSerializable()
class Trailers {
  int id;
  List<Trailer?> results = [];
  Trailers(this.id, this.results);

  factory Trailers.fromJson(Map<String, dynamic> json) {
    return Trailers(
        json['id'] as int,
        (json['results'] as List).map((e) =>
        e == null ? null : Trailer.fromJson(e as Map<String, dynamic>)).toList()
    );
  }

  Map<String, dynamic> toJson(Trailers instance) => {
    'id': instance.id,
    'results': instance.results
  };
}