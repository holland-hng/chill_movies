import 'package:chewie/chewie.dart';
import 'package:chill_movies/core/widgets/app_size.dart';
import 'package:chill_movies/core/widgets/constant.dart';
import 'package:chill_movies/core/widgets/dismiss_keyboard.dart';
import 'package:chill_movies/core/widgets/header_mobile.dart';
import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:chill_movies/screen/movie/widgets/material_desktop_controls.dart';
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
  final MovieEntity? movieInfo;
  const MovieMobileScreen({Key? key, this.movieInfo}) : super(key: key);

  @override
  _MovieMobileScreenState createState() => _MovieMobileScreenState(movieInfo);
}

class _MovieMobileScreenState extends State<MovieMobileScreen>
    with WidgetsBindingObserver {
  final MovieEntity? _movieInfo;
  FlickManager? flickManager;
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;

  _MovieMobileScreenState(this._movieInfo);

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    _videoPlayerController =
        VideoPlayerController.network(_movieInfo?.urlMovie ?? "");
    initPlayer();
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  bool videoInitialize = false;

  Future<void> initPlayer() async {
    await _videoPlayerController?.initialize();

    _chewieController = ChewieController(
      customControls: MaterialDesktopControls(),
      aspectRatio: _videoPlayerController?.value.aspectRatio,
      videoPlayerController: _videoPlayerController!,
      autoPlay: false,
      looping: true,
    );
    setState(() {
      videoInitialize = true;
    });
  }

  bool _isUserHasClickPlay = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print(state);
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
                          height: videoInitialize
                              ? AppSize.width /
                                  (_videoPlayerController?.value.aspectRatio ??
                                      1)
                              : (AppSize.width * 9 / 16).floorToDouble(),
                          child: !videoInitialize
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
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15, top: 30, bottom: 15, right: 15),
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


//https://img.himovies.to/resize/180x270/69/da/69daeeaabc72389010331464e8cda51e/69daeeaabc72389010331464e8cda51e.jpg
//The Conjuring: The Devil Made Me Do It