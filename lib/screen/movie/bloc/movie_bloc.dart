import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../entity/movie_entity.dart';
import 'repository/movie_repository.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieState());

  MovieRepository? _repo = MovieRepository();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    switch (event.eventType) {
      case MovieEventType.fetchMovie:
        break;
      case MovieEventType.fetchRelated:
        yield* _handleFetchRelatedMovies(event as FetchRelatedMoviesEvent);
        break;
      default:
        break;
    }
  }

  Stream<MovieState> _handleFetchRelatedMovies(
      FetchRelatedMoviesEvent event) async* {
    var listMovies = _repo?.fetchRelatedMovies("movieID");
    yield MovieState(listRelatives: listMovies);
  }
}

class MovieState extends Equatable {
  final List<MovieEntity>? listRelatives;

  MovieState({this.listRelatives});

  @override
  List<Object?> get props => [listRelatives];
}

enum MovieEventType {
  fetchMovie,
  fetchRelated,
}

class MovieEvent {
  final MovieEventType? eventType;
  MovieEvent(this.eventType);
}

class FetchRelatedMoviesEvent extends MovieEvent {
  FetchRelatedMoviesEvent() : super(MovieEventType.fetchRelated);
}
