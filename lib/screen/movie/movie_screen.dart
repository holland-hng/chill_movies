import 'package:chill_movies/core/constant/app_plaform.dart';
import 'package:chill_movies/di/init.dart';
import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:chill_movies/screen/movie/bloc/movie_bloc.dart';
import 'package:chill_movies/screen/movie/movie_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_web_screen.dart';

class MovieScreen extends StatefulWidget {
  final MovieEntity? movieInfo;
  const MovieScreen({Key? key, this.movieInfo}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState(movieInfo);
}

class _MovieScreenState extends State<MovieScreen> {
  final MovieEntity? _movieInfo;

  _MovieScreenState(this._movieInfo);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (BuildContext context) =>
              inject()..add(FetchRelatedMoviesEvent()),
        ),
      ],
      child: AppPlaform.isWeb
          ? MovieWebScreen()
          : MovieMobileScreen(movieInfo: _movieInfo),
    );
  }
}
