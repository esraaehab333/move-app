import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/movies/domain/entites/movie.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';

class GetPopularMovieUsecase extends BaseUsecase<List<Movie>, NoParemeters> {
  final BaseMoviesRepo baseMoviesRepo;

  GetPopularMovieUsecase({required this.baseMoviesRepo});

  @override
  Future<Either<Failure, List<Movie>>> call(NoParemeters para) async {
    return await baseMoviesRepo.getPopularMovies();
  }
}
