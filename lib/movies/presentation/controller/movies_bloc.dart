import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_events.dart';
import 'package:movies_app/movies/presentation/controller/movies_states.dart';
import '../../domain/usecases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MoviesEvents,MoviesState> {
  GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  GetPopularMoviesUseCase getPopularMoviesUseCase;
  GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;

  MoviesBloc({required this.getNowPlayingMoviesUseCase,required this.getPopularMoviesUseCase,required this.getTopRatedMoviesUseCase}) : super(const MoviesState()) {

    on<GetNowPlayingEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);


  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingEvent event, Emitter<MoviesState> emit)async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());   // Callable class
    result.fold(
            (l) => emit(state.copyWith( nowPlayingState: RequestState.error, message: l.message)),
            (r) => emit(state.copyWith(nowPlayingState: RequestState.loaded, nowPlayingMovies: r)));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesState> emit) async{
    final result=await getPopularMoviesUseCase(const NoParameters());  // Callable class
    result.fold(
            (l) => emit(state.copyWith(popularState: RequestState.error,popularMessage: l.message)),
            (r) => emit(state.copyWith(popularState: RequestState.loaded,popularMovies: r))
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesState> emit) async{
    final result=await getTopRatedMoviesUseCase(const NoParameters());   // Callable class
    result.fold(
            (l) => emit(state.copyWith(topRatedState: RequestState.error,topRatedMessage: l.message)),
            (r) => emit(state.copyWith(topRatedState: RequestState.loaded,topRatedMovies: r))
    );
  }
}
