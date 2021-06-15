import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:flutter/material.dart';
import 'info_movie_view.dart';

class DescriptionMovieView extends StatelessWidget {
  final MovieEntity? info;
  const DescriptionMovieView({
    Key? key,
    this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
            top: 15,
            bottom: 10,
          ),
          child: Text(
            info?.desciption ?? "",
            style: TextStyle(color: Colors.white),
          ),
        ),
        InfoMovieView(
          title: "Released",
          content: info?.releaseDate,
        ),
        InfoMovieView(
          title: "Genre",
          content: info?.genre,
        ),
        InfoMovieView(
          title: "Casts",
          content: info?.casts,
        ),
        InfoMovieView(
          title: "Duration",
          content: info?.duration,
        ),
        InfoMovieView(
          title: "Country",
          content: info?.country,
        ),
        InfoMovieView(
          title: "Production",
          content: info?.producttion,
        ),
      ],
    );
  }
}
