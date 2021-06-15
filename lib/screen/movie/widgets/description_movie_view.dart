import 'package:flutter/material.dart';
import 'info_movie_view.dart';

class DescriptionMovieView extends StatelessWidget {
  const DescriptionMovieView({
    Key? key,
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
            "After a crime brings them back to L.A., fugitive ex-con Dom Toretto re-ignites his feud with agent Brian O'Conner. However, while they're forced to face a enemy, both Dom and Brian must devote to an new trust if they hope to out maneuver him. And the two men will find the ideal way to get revenge: push the limits of what's potential behind this wheel.",
            style: TextStyle(color: Colors.white),
          ),
        ),
        InfoMovieView(
          title: "Released",
          content: "2009-04-02",
        ),
        InfoMovieView(
          title: "Genre",
          content: "Thriller, Action, Drama, Crime",
        ),
        InfoMovieView(
          title: "Casts",
          content:
              "Roger Fan, Laz Alonso, Loren Lazerine, Assaf Cohen, Julian Starks2",
        ),
        InfoMovieView(
          title: "Duration",
          content: "107 min",
        ),
        InfoMovieView(
          title: "Country",
          content: "United States of America",
        ),
        InfoMovieView(
          title: "Production",
          content:
              "One Race, Dentsu, Universal Pictures, Original Film, Relativity Media",
        ),
      ],
    );
  }
}
