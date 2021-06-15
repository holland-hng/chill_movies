import 'package:chill_movies/entity/%08movie_entity.dart';

class MovieService {
  List<MovieEntity> getRelatedMovies(String movieID) {
    return [
      MovieEntity(
        urlMovie:
            'https://cdn.tingtong.xyz/2021/06/10/FastFive(2011)%5B720P%5D-de42cf93d7.mp4',
        casts:
            "Dwayne Johnson, Jason Statham, Idris Elba, Vanessa Kirby, Eiza González",
        genre: "Action, Crime, Drama",
        duration: "136 min",
        country: 'United States of America',
        producttion: 'Universal Pictures',
        imdb: 6.4,
        urlCover:
            'https://img.himovies.to/resize/1280x768/1d/82/1d825f1399ccdb52c0327dd7296ad2c4/1d825f1399ccdb52c0327dd7296ad2c4.jpg',
        urlAvatar:
            'https://img.himovies.to/resize/180x270/3e/d2/3ed20…41b7c6dda3a6/3ed20afd5b521da5b79241b7c6dda3a6.jpg',
        releaseDate: '2019-08-01',
        desciption:
            'A spinoff of the Furious\' Fate, Emphasizing Johnson\'s US Diplomatic Security Agent Luke Hobbs forming an Improbable alliance with the Deckard Shaw of Statham.',
      ),
      MovieEntity(
        urlCover:
            'https://img.himovies.to/resize/1280x768/6d/d5/6dd5e77bff17aecda72c26312bfb7848/6dd5e77bff17aecda72c26312bfb7848.jpg',
        urlAvatar:
            'https://img.himovies.to/resize/180x270/86/d5/86d59…fb48512e7e37/86d59398d63d23dea5a4fb48512e7e37.jpg',
        urlMovie:
            'https://cdn.tingtong.xyz/2021/06/10/FastFive(2011)%5B720P%5D-de42cf93d7.mp4',
        name: 'Fast & Furious 6',
        imdb: 7,
        desciption:
            'Hobbs has Dominic and Brian re-assemble their crew to shoot a group of mercenaries down: Dominic unexpectedly gets elaborate confronting his deceased girlfriend, Letty.',
        releaseDate: '2013-05-21',
        genre: 'Crime, Thriller',
        casts:
            'Andrew Koji, Andrei Zayats, Jason Statham, Clara Paget, Rita Ora',
        duration: '131 min',
        country: 'United States of America',
        producttion:
            'Dentsu, Original Film, One Race, Relativity Media, Universal Pictures, Fuji Television Network, F & F VI Productions A.I.E',
      )
    ];
  }
}
