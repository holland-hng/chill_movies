import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:flutter/material.dart';

class NameMovieView extends StatelessWidget {
  const NameMovieView({
    Key? key,
    required MovieEntity? movieInfo,
  })  : _movieInfo = movieInfo,
        super(key: key);

  final MovieEntity? _movieInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30, bottom: 15, right: 15),
      child: Text(
        _movieInfo?.name ?? "",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 25,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
