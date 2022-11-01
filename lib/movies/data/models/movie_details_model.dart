import 'package:movies_app/movies/domain/entities/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({required super.posterPath,
    required super.id,
    required super.title,
    required super.voteAverage,
    required super.overView,
    required super.runTime,
    required super.releaseDate,
    required super.genres});

  factory MovieDetailsModel.fromJson(Map<String, dynamic>json){
  return MovieDetailsModel(
  posterPath: json['poster_path'],
  id: json['id'],
  title: json['title'],
  voteAverage: json['vote_average'].toDouble(),
  overView: json['overview'],
  runTime: json['runtime'],
  releaseDate: json['release_date'],
  genres: json['genres'].map((element){
    return GenresModel.fromJson(element);
  }).toList() ,
  );
  }

}

class GenresModel extends Genres {
  GenresModel({required super.name, required super.id});

  factory GenresModel.fromJson(Map<String,dynamic>json){
    return GenresModel(name: json['name'], id: json['id']);
  }

}
