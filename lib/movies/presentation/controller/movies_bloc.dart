import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:move_app/core/utils/enum.dart';
import 'package:move_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:move_app/movies/presentation/controller/movies_events.dart';
import 'package:move_app/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;

  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;

  final GetPopularMovieUsecase getPopularMovieUsecase;

  MoviesBloc(
    this.getNowPlayingMoviesUsecase,
    this.getPopularMovieUsecase,
    this.getTopRatedMoviesUsecase,
  ) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
      GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getNowPlayingMoviesUsecase();
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMessage: l.message,
          nowPlayingState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingMovies: r,
          nowPlayingState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(
      GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getPopularMovieUsecase();
    result.fold(
      (l) => emit(
        state.copyWith(
          popularMessage: l.message,
          popularState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularMovies: r,
          popularState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    final result = await getTopRatedMoviesUsecase();
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMessage: l.message,
          topRatedState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRatedMovies: r,
          topRatedState: RequestState.loaded,
        ),
      ),
    );
  }
}
