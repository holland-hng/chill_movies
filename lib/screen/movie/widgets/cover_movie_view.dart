import 'package:chill_movies/core/widgets/app_size.dart';
import 'package:chill_movies/core/widgets/constant.dart';
import 'package:flutter/material.dart';

class CoverMovieView extends StatelessWidget {
  final Function? playMovie;
  const CoverMovieView({
    Key? key,
    this.playMovie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      height: (AppSize.width * 9 / 16).floorToDouble(),
      child: Stack(
        children: [
          SizedBox.expand(
            child: Image.network(
              "https://img.himovies.to/resize/1280x768/71/54/715407760baa697b9fe3bed477a2dfcc/715407760baa697b9fe3bed477a2dfcc.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  AppColor.primaryColor,
                  AppColor.primaryColor.withOpacity(0.98),
                  AppColor.primaryColor.withOpacity(0.6),
                  AppColor.primaryColor.withOpacity(0.5),
                  AppColor.primaryColor.withOpacity(0.3),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.23),
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              child: Icon(
                Icons.play_arrow,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            bottom: 15,
            left: 15,
            child: Container(
              width: AppSize.width - 30,
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
          ),
          SizedBox.expand(child: MaterialButton(onPressed: () {
            playMovie!();
          })),
        ],
      ),
    );
  }
}
