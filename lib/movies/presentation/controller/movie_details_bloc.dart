import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:move_app/core/utils/enum.dart';
import 'package:move_app/movies/domain/entites/movie_detail.dart';
import 'package:move_app/movies/domain/entites/recommendatoin.dart';
import 'package:move_app/movies/domain/usecase/get_movie_details_usecase.dart';
import 'package:move_app/movies/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUsecase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetailsUsecase getMovieDetailsUsecase;
  final GetRecommendationUseCase getRecommendationUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUsecase(
      MovieDetailsParameters(
        moveId: event.id,
      ),
    );
    result.fold(
      (l) => emit(state.copyWith(
        message: l.message,
        movieDetailsState: RequestState.error,
      )),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result = await getRecommendationUseCase(
      RecommendationParameters(
        event.id,
      ),
    );

    result.fold(
      (l) => emit(state.copyWith(
        recommendationState: RequestState.error,
        recommendationMessage: l.message,
      )),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestState.loaded,
        ),
      ),
    );
  }
}
