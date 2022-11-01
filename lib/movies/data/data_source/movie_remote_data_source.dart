import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/movies/data/models/Recommendations_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import '../../../core/network/error_message_model.dart';
import '../models/movie_details_model.dart';

abstract class BaseMovieRemoteDataSource{
  Future<List<MovieModel>>getNowPlayingMovies();
  Future<List<MovieModel>>getPopularMovies();
  Future<List<MovieModel>>getTopRatedMovies();
  Future<MovieDetailsModel>getMovieDetails(MovieDetailsParameters parameter);
Future<List<RecommendationModel>>getRecommendations(RecommendationParameter parameter);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource{

  @override
  Future<List<MovieModel>>getNowPlayingMovies()async{
    final response=await Dio().get(ApiConstants.nowPlayingPath);
    if(response.statusCode==200){
      return ((response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList());
    }else{
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async{
    final response=await Dio().get(ApiConstants.popularMoviesPath);
    if(response.statusCode==200){
      return ((response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList());
    }else{
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async{
    final response=await Dio().get(ApiConstants.topRatedPath);
    if(response.statusCode==200){
      return ((response.data['results'] as List).map((e) => MovieModel.fromJson(e)).toList());
    }else{
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameter) async{
    final response=await Dio().get(ApiConstants.movieDetailsPath(parameter.movieId));
    if(response.statusCode==200){
      return (MovieDetailsModel.fromJson(response.data));
    }else{
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(RecommendationParameter parameter) async{
    final response=await Dio().get(ApiConstants.recommendationPath(parameter.id));
    if(response.statusCode==200){
      return ((response.data['results'] as List).map((element) => RecommendationModel.fromJson(element)).toList());
    }else{
      throw ServerExceptions(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}