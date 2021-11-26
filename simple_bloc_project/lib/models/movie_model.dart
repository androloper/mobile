import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Movie {
  int vote_count;
  int id;
  bool video;
  var vote_average;
  String title;
  double popularity;
  String poster_path;
  String original_language;
  String original_title;
  List<int> genre_ids = [];
  String backdrop_path;
  bool adult;
  String overview;
  String release_date;

  Movie(this.vote_count,
      this.id,
      this.video,
      this.vote_average,
      this.title,
      this.popularity,
      this.poster_path,
      this.original_language,
      this.original_title,
      this.genre_ids,
      this.backdrop_path,
      this.adult,
      this.overview,
      this.release_date);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        json['vote_count'] as int,
        json['id'] as int,
        json['video'] as bool,
        json['vote_average'],
        json['title'] as String,
        (json['popularity'] as num).toDouble(),
        json['poster_path'] as String,
        json['original_language'] as String,
        json['original_title'] as String,
        (json['genre_ids'] as List).map((e) => e as int).toList(),
        json['backdrop_path'] as String,
        json['adult'] as bool,
        json['overview'] as String,
        json['release_date'] as String);
  }

  Map<String, dynamic> toJson(Movie instance) =>
      {
        'vote_count': instance.vote_count,
        'id': instance.id,
        'video': instance.video,
        'vote_average': instance.vote_average,
        'title': instance.title,
        'popularity': instance.popularity,
        'poster_path': instance.poster_path,
        'original_language': instance.original_language,
        'original_title': instance.original_title,
        'genre_ids': instance.genre_ids,
        'backdrop_path': instance.backdrop_path,
        'adult': instance.adult,
        'overview': instance.overview,
        'release_date': instance.release_date
      };
}