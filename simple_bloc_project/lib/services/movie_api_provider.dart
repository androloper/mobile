import 'package:http/http.dart' as http;
import 'package:simple_bloc_project/models/trailers_model.dart';
import 'dart:async';
import 'dart:convert';
import '../models/movies_model.dart';

class MovieApiProvider {
  final _baseUrl = "http://api.themoviedb.org/3/movie";
  final _apiKey = "your_api_key";
  //there is an api key in notification in themoviedb.org

  Future<Movies> fetchMovieList() async {
    final response = await http.get(Uri.parse("$_baseUrl/popular?api_key=$_apiKey"));
    if (response.statusCode == 200) {
      return Movies.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Trailers> fetchTrailer(int movieId) async {
    final response = await http.get(Uri.parse("$_baseUrl/$movieId/videos?api_key=$_apiKey"));
    if (response.statusCode == 200) {
      return Trailers.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}