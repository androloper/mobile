import 'dart:async';
import 'package:simple_bloc_project/models/trailers_model.dart';
import '../models/movies_model.dart';
import 'movie_api_provider.dart';

class Repository {
  final moviesApiProvider = MovieApiProvider();

  Future<Movies> fetchAllMovies() => moviesApiProvider.fetchMovieList();

  Future<Trailers> fetchTrailers(int movieId) => moviesApiProvider.fetchTrailer(movieId);
}