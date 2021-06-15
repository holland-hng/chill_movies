import 'package:chill_movies/core/constant/app_plaform.dart';
import 'package:chill_movies/di/init.dart';
import 'package:chill_movies/screen/movie/bloc/movie_bloc.dart';
import 'package:chill_movies/screen/movie/movie_mobile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'movie_web_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (BuildContext context) => inject(),
        ),
      ],
      child: AppPlaform.isWeb ? MovieWebScreen() : MovieMobileScreen(),
    );
  }
}
