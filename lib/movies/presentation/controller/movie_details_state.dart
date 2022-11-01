import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {
  final RequestState movieDetailsState;
  final MovieDetails? movieDetails;
  final String message;
  final RequestState recommendationState;
  final List<Recommendation>recommendationsList;
  final String recommendationMessage;

  const MovieDetailsState({
    this.movieDetailsState=RequestState.loading,
    this.movieDetails,
    this.message='',
  this.recommendationMessage='',
  this.recommendationState=RequestState.loading,
  this.recommendationsList=const[]});

MovieDetailsState copyWith({
   RequestState? movieDetailsState,
   MovieDetails? movieDetails,
   String? message,
   RequestState? recommendationState,
   List<Recommendation>?recommendationsList,
   String? recommendationMessage,
}){
return MovieDetailsState(
  movieDetailsState: movieDetailsState ?? this.movieDetailsState,
  movieDetails: movieDetails ?? this.movieDetails,
  message: message ?? this.message,
  recommendationState: recommendationState ?? this.recommendationState,
  recommendationsList: recommendationsList ?? this.recommendationsList,
  recommendationMessage: recommendationMessage ?? this.recommendationMessage,
);
}

  @override
  List<Object?> get props => [movieDetails,movieDetailsState,message];

}
