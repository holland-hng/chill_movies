import 'package:flutter/material.dart';

import 'di/init.dart';
import 'screen/movie/movie_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await configureInjection();
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
      home: MovieScreen(),
    );
  }
}
