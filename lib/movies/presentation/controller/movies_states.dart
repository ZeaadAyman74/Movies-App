import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import '../../domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String message;
  final List<Movie> popularMovies;
  final RequestState popularState;
  final String popularMessage;
  final List<Movie> topRatedMovies;
  final RequestState topRatedState;
  final String topRatedMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.message = '',
    this.popularMovies = const [],
    this.popularMessage = '',
    this.popularState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMessage = '',
    this.topRatedState = RequestState.loading,
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? message,
    List<Movie>? popularMovies,
    RequestState? popularState,
    String? popularMessage,
     List<Movie>? topRatedMovies,
     RequestState? topRatedState,
     String? topRatedMessage,

  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      message: message ?? this.message,
      popularMovies: popularMovies ?? this.popularMovies,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [nowPlayingMovies, nowPlayingState, message,popularMovies,popularState,popularMessage];
}
