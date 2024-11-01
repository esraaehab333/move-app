import 'package:dartz/dartz.dart';
import 'package:move_app/core/error/failure.dart';
import 'package:move_app/movies/domain/entites/movie.dart';
import 'package:move_app/movies/domain/entites/movie_detail.dart';
import 'package:move_app/movies/domain/entites/recommendatoin.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_recommendation_usecase.dart';

abstract class BaseMoviesRepo {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameters para);
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters);
}
