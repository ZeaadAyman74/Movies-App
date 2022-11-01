import 'package:equatable/equatable.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();
}


class GetMovieDetailsEvent extends MovieDetailsEvent {
 final int movieId;
 final String name;
const  GetMovieDetailsEvent({required this.movieId,required this.name});

  @override
  List<Object?> get props =>[movieId];
}
class GetRecommendationsEvent extends MovieDetailsEvent {
  final int movieId;

 const GetRecommendationsEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}