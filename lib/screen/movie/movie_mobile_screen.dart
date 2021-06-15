import 'package:chewie/chewie.dart';
import 'package:chill_movies/core/widgets/app_size.dart';
import 'package:chill_movies/core/widgets/constant.dart';
import 'package:chill_movies/core/widgets/dismiss_keyboard.dart';
import 'package:chill_movies/core/widgets/header_mobile.dart';
import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:chill_movies/screen/movie/widgets/material_desktop_controls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';
import 'widgets/cover_movie_view.dart';
import 'widgets/description_movie_view.dart';
import 'widgets/name_movie_view.dart';
import 'widgets/related_movies_view.dart';
import 'widgets/title_you_may_also_like.dart';
import 'widgets/trailer_button.dart';

class MovieMobileScreen extends StatefulWidget {
  final MovieEntity? movieInfo;
  const MovieMobileScreen({Key? key, this.movieInfo}) : super(key: key);

  @override
  _MovieMobileScreenState createState() => _MovieMobileScreenState(movieInfo);
}

class _MovieMobileScreenState extends State<MovieMobileScreen> {
  final MovieEntity? _movieInfo;

  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  bool _videoInitialize = false;
  bool _isUserHasClickPlay = false;

  _MovieMobileScreenState(this._movieInfo);

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.network(_movieInfo?.urlMovie ?? "");
    initPlayer();
    super.initState();
  }

  Future<void> initPlayer() async {
    await _videoPlayerController?.initialize();
    _chewieController = ChewieController(
      customControls: MaterialControls(),
      aspectRatio: _videoPlayerController?.value.aspectRatio,
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
      looping: true,
    );
    setState(() {
      _videoInitialize = true;
    });
  }

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
              automaticallyImplyLeading: false,
              floating: true,
              title: SearchMobileView(),
              backgroundColor: Colors.black,
              stretch: true,
              snap: true,
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
                          height: _videoInitialize
                              ? AppSize.width /
                                  (_videoPlayerController?.value.aspectRatio ??
                                      1)
                              : (AppSize.width * 9 / 16).floorToDouble(),
                          child: !_videoInitialize
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Chewie(
                                  controller: _chewieController!,
                                ),
                        ),
                      ),
                      !_isUserHasClickPlay
                          ? CoverMovieView(
                              info: _movieInfo,
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
                    NameMovieView(
                      movieInfo: _movieInfo,
                    ),
                  TrailerButton(
                    info: _movieInfo,
                    onClickHD: () {},
                    onClickIMDB: () {},
                    onClickTrailer: () {},
                  ),
                  DescriptionMovieView(
                    info: _movieInfo,
                  ),
                  TitleYouMayAlsoLike(),
                  RelatedMoviesView(),
                  Container(
                    width: AppSize.width,
                    color: AppColor.primaryColor,
                    height: 500,
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
