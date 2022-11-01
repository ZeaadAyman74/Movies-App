import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({required super.id,
    required super.overView,
    required super.backdropPath,
    required super.voteAverage,
    required super.genreIds,
    required super.title,
    required super.releaseDate});

  factory MovieModel.fromJson(Map<String, dynamic>json)=>MovieModel(
        id: json['id'],
        overView: json['overview'],
        backdropPath: json['backdrop_path'],
        voteAverage: json['vote_average'].toDouble(),
        genreIds: json['genre_ids'],
        title: json['title'],
        releaseDate: json['release_date']);

}
