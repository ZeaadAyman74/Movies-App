import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movie_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails,MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameter) async{
    return await baseMoviesRepository.getMovieDetails(parameter);
  }
}

class MovieDetailsParameters extends Equatable {
 final int movieId;
 final String name;

  const MovieDetailsParameters({required this.movieId,required this.name});

  @override
  List<Object?> get props => [movieId];

}