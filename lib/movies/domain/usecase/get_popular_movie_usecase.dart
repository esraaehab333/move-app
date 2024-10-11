import 'package:move_app/movies/domain/entites/movie.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';

class GetPopularMovieUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMovieUsecase({required this.baseMoviesRepo});

  Future<List<Movie>> execute() async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
