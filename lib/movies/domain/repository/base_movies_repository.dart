import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import '../../../core/error/failure.dart';
import '../usecases/get_movie_details_usecase.dart';
import '../usecases/get_recommendations_usecase.dart';

abstract class BaseMoviesRepository{
  Future<Either<Failure,List<Movie>>>getNowPlaying();
  Future<Either<Failure,List<Movie>>>getPopularMovies();
  Future<Either<Failure,List<Movie>>>getTopRatedMovies();
  Future<Either<Failure,MovieDetails>>getMovieDetails(MovieDetailsParameters parameter);
  Future<Either<Failure,List<Recommendation>>>getRecommendations(RecommendationParameter parameter);
}