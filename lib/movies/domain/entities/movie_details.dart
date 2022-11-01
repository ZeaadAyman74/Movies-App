import 'package:equatable/equatable.dart';

class MovieDetails extends Equatable {
  final String posterPath;
  final int id;
  final String title;
  final double voteAverage;
  final String overView;
  final int runTime;
  final String releaseDate;
  final List<dynamic> genres;

  const MovieDetails({
    required this.posterPath,
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overView,
    required this.runTime,
    required this.releaseDate,
    required this.genres,
  });

  @override
  List<Object?> get props => [
        posterPath,
        id,
        title,
        voteAverage,
        overView,
        runTime,
        releaseDate,
        genres
      ];
}

class Genres {
  final String name;
  final int id;

  Genres({required this.name, required this.id});
}
