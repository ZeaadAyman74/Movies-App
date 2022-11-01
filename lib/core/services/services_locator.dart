import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_recommendations_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import '../../movies/domain/usecases/get_now_playing_usecase.dart';

final sl=GetIt.instance;
class ServicesLocator {
  void init(){
    /// BLOC PROVIDER
    sl.registerFactory<MoviesBloc>(() => MoviesBloc(getNowPlayingMoviesUseCase: sl(), getTopRatedMoviesUseCase: sl(),getPopularMoviesUseCase: sl()));
    sl.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(sl(),sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());

    /// Repository
    sl.registerLazySingleton<BaseMoviesRepository>(() => MoviesRepository(sl()));

/// USE CASES
    sl.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(sl()));
    sl.registerLazySingleton<GetPopularMoviesUseCase>(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(() => GetTopRatedMoviesUseCase(sl()));
    sl.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(sl()));
    sl.registerLazySingleton<GetRecommendationsUseCase>(() => GetRecommendationsUseCase(sl()));

  }
}