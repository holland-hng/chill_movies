import 'package:chewie/chewie.dart';
import 'package:chill_movies/core/widgets/app_size.dart';
import 'package:chill_movies/core/widgets/constant.dart';
import 'package:chill_movies/core/widgets/dismiss_keyboard.dart';
import 'package:chill_movies/core/widgets/film_card.dart';
import 'package:chill_movies/core/widgets/header_mobile.dart';

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'widgets/cover_movie_view.dart';
import 'widgets/description_movie_view.dart';
import 'widgets/related_movies_view.dart';
import 'widgets/trailer_button.dart';

class MovieMobileScreen extends StatefulWidget {
  const MovieMobileScreen({Key? key}) : super(key: key);

  @override
  _MovieMobileScreenState createState() => _MovieMobileScreenState();
}

class _MovieMobileScreenState extends State<MovieMobileScreen> {
  FlickManager? flickManager;
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(
        "https://cdn.tingtong.xyz/2021/06/10/FastFive(2011)%5B720P%5D-de42cf93d7.mp4")
      ..initialize();

    _chewieController = ChewieController(
      aspectRatio: 16 / 9,
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
      looping: true,
    );
    super.initState();
  }

  bool _isUserHasClickPlay = false;
  @override
  Widget build(BuildContext context) {
    AppSize.config(context);
    return GestureDetector(
      onTap: () {
        DismissKeyboard.exec(context);
      },
      child: Scaffold(
        backgroundColor: AppColor.primaryColor,
        appBar: AppBar(
          title: Text(
            "Chill Movies",
            style: TextStyle(
                fontFamily: 'BLAKLITN',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          actions: [
            ProfileButton(),
          ],
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              title: SearchMobileView(),
              backgroundColor: Colors.black,
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      Center(
                        child: Container(
                          color: Colors.black,
                          width: AppSize.width,
                          height: (AppSize.width * 9 / 16).floorToDouble(),
                          child: Chewie(
                            controller: _chewieController!,
                          ),
                        ),
                      ),
                      !_isUserHasClickPlay
                          ? CoverMovieView(
                              playMovie: () {
                                setState(() {
                                  _isUserHasClickPlay = true;
                                  _videoPlayerController?.play();
                                });
                              },
                            )
                          : SizedBox(),
                    ],
                  ),
                  if (_isUserHasClickPlay)
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 30, bottom: 15, right: 15),
                      child: Text(
                        "Fast & Furious",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  TrailerButton(
                    onClickHD: () {},
                    onClickIMDB: () {},
                    onClickTrailer: () {},
                  ),
                  DescriptionMovieView(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, top: 30, bottom: 15),
                    child: Text(
                      "You may also like",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  RelatedMoviesView(),
                  Container(
                    width: AppSize.width,
                    color: AppColor.primaryColor,
                    height: 1000,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//https://img.himovies.to/resize/180x270/69/da/69daeeaabc72389010331464e8cda51e/69daeeaabc72389010331464e8cda51e.jpg
//The Conjuring: The Devil Made Me Do It