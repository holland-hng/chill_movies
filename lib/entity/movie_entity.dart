//part 'movie_entity.g.dart';

class MovieEntity {
  final String? id;
  final String? urlMovie;
  final String? urlCover;
  final String? urlAvatar;
  final String? name;
  final String? desciption;
  final String? releaseDate;
  final String? genre;
  final String? casts;
  final String? duration;
  final String? country;
  final String? producttion;
  final double? imdb;
  final String? urlTrailer;

  MovieEntity({
    this.urlTrailer,
    this.name,
    this.imdb,
    this.id,
    this.urlMovie,
    this.desciption,
    this.releaseDate,
    this.genre,
    this.casts,
    this.duration,
    this.country,
    this.producttion,
    this.urlCover,
    this.urlAvatar,
  });
}
