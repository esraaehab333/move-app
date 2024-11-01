import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/core/usecase/base_usecase.dart';
import 'package:move_app/movies/domain/entites/movie_detail.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';

class GetMovieDetailsUsecase
    extends BaseUsecase<MovieDetail, MovieDetailsParameters> {
  final BaseMoviesRepo baseMoviesRepo;

  GetMovieDetailsUsecase({required this.baseMoviesRepo});
  @override
  Future<Either<Failure, MovieDetail>> call(MovieDetailsParameters para) async {
    return await baseMoviesRepo.getMovieDetails(para);
  }
}

class MovieDetailsParameters extends Equatable {
  final int moveId;

  const MovieDetailsParameters({required this.moveId});
  @override
  List<Object?> get props => [moveId];
}
