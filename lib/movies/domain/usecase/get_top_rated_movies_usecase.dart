import 'package:move_app/movies/domain/entites/movie.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';

class GetTopRatedMoviesUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetTopRatedMoviesUsecase({required this.baseMoviesRepo});

  Future<List<Movie>> execute() async {
    return await baseMoviesRepo.getTopRatedMovies();
  }
}
