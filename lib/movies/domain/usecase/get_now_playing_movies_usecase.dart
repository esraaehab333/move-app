import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/movies/domain/entites/movie.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';

class GetNowPlayingMoviesUsecase extends BaseUsecase<List<Movie>> {
  final BaseMoviesRepo baseMoviesRepo;

  GetNowPlayingMoviesUsecase({required this.baseMoviesRepo});

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMoviesRepo.getNowPlayingMovies();
  }
}
