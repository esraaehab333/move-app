import 'package:move_app/movies/domain/entites/movie.dart';

abstract class BaseMoviesRepo {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
