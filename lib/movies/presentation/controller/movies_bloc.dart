import 'package:bloc/bloc.dart';
import 'package:move_app/movies/domain/usecase/get_now_playing_movies_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_popular_movie_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_top_rated_movies_usecase.dart';
import 'package:move_app/movies/presentation/controller/movies_events.dart';
import 'package:move_app/movies/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUsecase getNowPlayingMoviesUsecase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  final GetPopularMovieUsecase getPopularMovieUsecase;
  MoviesBloc(this.getNowPlayingMoviesUsecase, this.getPopularMovieUsecase,
      this.getTopRatedMoviesUsecase)
      : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>((event, emit) => {});
  }
}
