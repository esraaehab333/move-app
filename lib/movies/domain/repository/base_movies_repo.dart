import 'package:move_app/movies/domain/entites/movie.dart';

abstract class BaseMoviesRepo {
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopUlarMoview();
  Future<List<Movie>> getTopRatedMovies();
}
