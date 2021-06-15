import 'package:chill_movies/core/widgets/film_card.dart';
import 'package:flutter/material.dart';

class RelatedMoviesView extends StatelessWidget {
  const RelatedMoviesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      mainAxisSpacing: 15,
      crossAxisSpacing: 6,
      primary: true,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 9 / 16,
      children: <Widget>[
        FilmCard(),
        FilmCard(),
        FilmCard(),
        FilmCard(),
      ],
    );
  }
}
