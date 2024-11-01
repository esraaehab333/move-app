import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/excption.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:move_app/movies/domain/entites/movie.dart';
import 'package:move_app/movies/domain/entites/movie_detail.dart';
import 'package:move_app/movies/domain/entites/recommendatoin.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_recommendation_usecase.dart';

class MoviesRepository extends BaseMoviesRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository({required this.baseMovieRemoteDataSource});

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMsg),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMsg),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovies();

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMsg),
      );
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters para) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(para);

    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
        ServerFailure(failure.errorMessageModel.statusMsg),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
        failure.errorMessageModel.statusMsg,
      ));
    }
  }
}
