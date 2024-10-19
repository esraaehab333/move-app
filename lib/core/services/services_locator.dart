import 'package:get_it/get_it.dart';
import 'package:move_app/movies/data/datasource/movie_remote_data_source.dart';
import 'package:move_app/movies/data/repository/movies_repository.dart';
import 'package:move_app/movies/domain/repository/base_movies_repo.dart';
import 'package:move_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:move_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //BLOC
    sl.registerFactory  (
      () => MoviesBloc(
        sl(),
        sl(),
        sl(),
      ),
    );
    //USE CASE
    sl.registerLazySingleton(
      () => GetNowPlayingMoviesUsecase(
        baseMoviesRepo: sl(),
      ),
    );
    // REPOSITORY
    sl.registerLazySingleton<BaseMoviesRepo>(
      () => MoviesRepository(
        baseMovieRemoteDataSource: sl(),
      ),
    );
    //DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
