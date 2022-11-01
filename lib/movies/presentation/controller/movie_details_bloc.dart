import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';
import '../../domain/usecases/get_recommendations_usecase.dart';
import 'movie_details_event.dart';
import 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  GetMovieDetailsUseCase getMovieDetailsUseCase;
  GetRecommendationsUseCase getRecommendationsUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationsUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetRecommendationsEvent>(_getRecommendations);
  }

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
        MovieDetailsParameters(movieId: event.movieId, name: event.name));
    result.fold(
        (l) => emit(state.copyWith(
            message: l.message, movieDetailsState: RequestState.error)),
        (r) => emit(state.copyWith(
            movieDetailsState: RequestState.loaded, movieDetails: r)));
  }

  FutureOr<void> _getRecommendations(
      GetRecommendationsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationsUseCase(RecommendationParameter(event.movieId));
    result.fold(
        (l) => emit(state.copyWith(
            recommendationMessage: l.message,
            recommendationState: RequestState.error)),
        (r) => emit(state.copyWith(
            recommendationState: RequestState.loaded, recommendationsList: r)));
  }
}
