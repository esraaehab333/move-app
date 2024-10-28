import 'package:equatable/equatable.dart';
import 'package:move_app/core/utils/enum.dart';
import 'package:move_app/movies/domain/entites/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestState nowPlayingState;
  final List<Movie> popularMovies;
  final String popularMessage;
  final RequestState popularState;
  final List<Movie> topRatedMovies;
  final String topRatedMessage;
  final RequestState topRatedState;
  const MoviesStates({
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = "",
    this.nowPlayingMovies = const [],
    this.popularMovies = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = "",
    this.topRatedMovies = const [],
    this.topRatedMessage = "",
    this.topRatedState = RequestState.loading,
  });

  MoviesStates copyWith({
    List<Movie>? nowPlayingMovies,
    String? nowPlayingMessage,
    RequestState? nowPlayingState,
    List<Movie>? popularMovies,
    String? popularMessage,
    RequestState? popularState,
    List<Movie>? topRatedMovies,
    String? topRatedMessage,
    RequestState? topRatedState,
  }) {
    return MoviesStates(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      popularMessage: popularMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.nowPlayingMovies,
      popularState: popularState ?? this.nowPlayingState,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        popularMessage,
        popularMovies,
        popularState,
        topRatedMessage,
        topRatedMovies,
        topRatedState
      ];
}
