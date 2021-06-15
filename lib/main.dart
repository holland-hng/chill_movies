import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:flutter/material.dart';

import 'di/init.dart';
import 'screen/movie/movie_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(RootApp());
}

class RootApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Quicksand',
      ),
      home: MovieScreen(
        movieInfo: MovieEntity(
          urlAvatar:
              'https://img.himovies.to/resize/180x270/8b/2f/8b2fc90ee7a9b1330371016d6d51b6fa/8b2fc90ee7a9b1330371016d6d51b6fa.jpg',
          urlMovie:
              'https://cdn.tingtong.xyz/2021/06/10/FastFive(2011)%5B720P%5D-de42cf93d7.mp4',
          urlTrailer: 'https://youtu.be/uSDNZeRX_1Y',
          urlCover:
              'https://img.himovies.to/resize/1280x768/71/54/715407760baa697b9fe3bed477a2dfcc/715407760baa697b9fe3bed477a2dfcc.jpg',
          name: 'Fast Five',
          imdb: 7.3,
          desciption:
              'Former cop Brian O\'Conner partners with Dom Toretto that is Ex Con Across the opposite side of This law Enforcement. They\'ve blown to elude police since Dom broke out of custody. They must pull one final job in order to gain their freedom.',
          releaseDate: '2011-04-20',
          genre: 'Crime, Action, Thriller',
          casts:
              'Luis Da Silva Jr., Michelle Rodriguez, Pedro García, Michael Irby, Fernando Chien',
          duration: '130 min',
          country: 'United States of America',
          producttion: 'Original Film, One Race, Universal Pictures',
        ),
      ),
    );
  }
}
