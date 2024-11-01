import 'package:dio/dio.dart';
import 'package:move_app/core/error/excption.dart';
import 'package:move_app/core/network/error_message_model.dart';
import 'package:move_app/movies/data/models/movie_details_model.dart';
import 'package:move_app/movies/data/models/movie_model.dart';
import 'package:move_app/movies/data/models/recommendation_model.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_recommendation_usecase.dart';

import '../../../core/utils/app_constances.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters para);

  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviePath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters para) async {
    final response =
        await Dio().get(ApiConstance.movieDetailsPath(para.moveId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
      RecommendationParameters parameters) async {
    final response =
        await Dio().get(ApiConstance.recommendationPath(parameters.id));

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
          (response.data["results"] as List).map(
        (e) => RecommendationModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromjson(response.data),
      );
    }
  }
}
