import 'package:rxdart/rxdart.dart';
import 'package:simple_bloc_project/models/movies_model.dart';
import 'package:simple_bloc_project/services/movie_repository.dart';

class MoviesBloc {
  final _repository = Repository();
  final _moviesFetcher = PublishSubject<Movies>();

  Stream<Movies> get allMovies => _moviesFetcher.stream;

  fetchAllMovies() async {
    Movies itemModel = await _repository.fetchAllMovies();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}

final bloc = MoviesBloc();