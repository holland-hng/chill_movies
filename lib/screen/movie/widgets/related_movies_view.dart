import 'package:chill_movies/core/widgets/film_card.dart';
import 'package:chill_movies/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RelatedMoviesView extends StatelessWidget {
  const RelatedMoviesView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieBloc, MovieState>(
        builder: (context, state) {
          List<Widget> _listFilmCard = [];
          for (int i = 0; i < (state.listRelatives?.length ?? 0); i++) {
            _listFilmCard.add(FilmCard(
              info: state.listRelatives?[i],
            ));
          }
          return GridView.count(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              mainAxisSpacing: 15,
              crossAxisSpacing: 6,
              primary: true,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 9 / 16,
              children: _listFilmCard);
        },
        listener: (context, state) {});
  }
}
