import 'package:equatable/equatable.dart';
import 'package:move_app/core/utils/enum.dart';
import 'package:move_app/movies/domain/entites/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlayingMovies;
  final String nowPlayingMessage;
  final RequestState nowPlayingState;
  const MoviesStates(
      {this.nowPlayingState = RequestState.loading,
      this.nowPlayingMessage = "",
      this.nowPlayingMovies = const []});
  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
      ];
}
