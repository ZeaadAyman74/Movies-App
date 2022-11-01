import 'package:equatable/equatable.dart';

class Movie extends Equatable  {
 final int id;
final String overView;
final String backdropPath;
final double voteAverage;
final List<dynamic> genreIds;
final String title;
final String releaseDate;

   const Movie(
      {required this.id,
      required this.overView,
      required this.backdropPath,
      required this.voteAverage,
      required this.genreIds,
      required this.title,
      required this.releaseDate,});

@override
  List<Object> get props =>[id,overView,backdropPath,voteAverage,genreIds,title,releaseDate];
}


