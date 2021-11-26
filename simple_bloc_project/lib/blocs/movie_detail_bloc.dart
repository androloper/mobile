import 'dart:async';
import 'dart:core';
import 'package:rxdart/rxdart.dart';
import 'package:simple_bloc_project/models/trailer_model.dart';
import 'package:simple_bloc_project/models/trailers_model.dart';
import 'package:simple_bloc_project/services/movie_repository.dart';

class MovieDetailBloc {
  final _repository = Repository();
  final _movieId = PublishSubject<int>();
  final _trailers = BehaviorSubject<Future<Trailers>>();
  int id= 0;        //for emptyFuture
  List<Trailer?> trailer = [];  //for emptyFuture

  Function(int) get fetchTrailersById => _movieId.sink.add;

  Stream<Future<Trailers>> get movieTrailers => _trailers.stream;

  MovieDetailBloc() {
    _movieId.stream.transform(_itemTransformer()).pipe(_trailers);
  }

  _itemTransformer() {
    return ScanStreamTransformer<int, Future<Trailers>>((trailer, int id, index) {
        trailer = _repository.fetchTrailers(id);
        return trailer;
      },
      emptyFuture(), //making an unimportant function for null safety
    );
  }

  Future<Trailers> emptyFuture() async {
    return Trailers(id, trailer);
  }

  dispose() async {
    _movieId.close();
    await _trailers.drain();
    _trailers.close();
  }
}