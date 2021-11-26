import 'package:json_annotation/json_annotation.dart';
import 'movie_model.dart';

@JsonSerializable()
class Movies {
  int page;
  int total_results;
  int total_pages;
  List<Movie?> results = [];
  Movies(this.page, this.total_results, this.total_pages, this.results);


  factory Movies.fromJson(Map<String, dynamic> json) {
    return Movies(
        json['page'] as int,
        json['total_results'] as int,
        json['total_pages'] as int,
        (json['results'] as List).map((e) =>
        e == null ? null : Movie.fromJson(e as Map<String, dynamic>)).toList()
    );
  }

  Map<String, dynamic> toJson(Movies instance) => {
    'page': instance.page,
    'total_results': instance.total_results,
    'total_pages': instance.total_pages,
    'results': instance.results
  };
}