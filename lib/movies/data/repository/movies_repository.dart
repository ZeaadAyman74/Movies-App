import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movie.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
      return Right(result);
    } on ServerExceptions catch (e) {
      return left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final result = await baseMovieRemoteDataSource.getTopRatedMovies();
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(
      MovieDetailsParameters parameter) async {
    try {
      final result = await baseMovieRemoteDataSource.getMovieDetails(parameter);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendations(
      RecommendationParameter parameter) async {
    try {
      final result =
          await baseMovieRemoteDataSource.getRecommendations(parameter);
      return Right(result);
    } on ServerExceptions catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
