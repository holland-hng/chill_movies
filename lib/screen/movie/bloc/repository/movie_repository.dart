import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:chill_movies/screen/movie/bloc/repository/service/movie_service.dart';
import 'package:injectable/injectable.dart';

//@singleton
class MovieRepository {
  MovieService _service = MovieService();
  List<MovieEntity> fetchRelatedMovies(String movieID) {
    return _service.getRelatedMovies(movieID);
  }
}
