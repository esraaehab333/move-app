import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/movies/domain/entites/movie.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';

class GetPopularMovieUsecase {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMovieUsecase({required this.baseMoviesRepo});

  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
