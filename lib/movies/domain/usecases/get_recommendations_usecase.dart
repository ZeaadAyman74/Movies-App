import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendations.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationsUseCase extends BaseUseCase<List<Recommendation>,RecommendationParameter>{
  BaseMoviesRepository baseMoviesRepository;

  GetRecommendationsUseCase( this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameter parameter) async{
    return await baseMoviesRepository.getRecommendations(parameter);
  }

}

class RecommendationParameter extends Equatable {
 final int id;

 const RecommendationParameter(this.id);

  @override
  List<Object?> get props => [id];

}