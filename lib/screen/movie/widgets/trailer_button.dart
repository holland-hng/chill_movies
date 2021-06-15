import 'package:chill_movies/core/widgets/app_size.dart';
import 'package:chill_movies/core/widgets/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrailerButton extends StatelessWidget {
  final Function? onClickTrailer;
  final Function? onClickHD;
  final Function? onClickIMDB;
  const TrailerButton({
    Key? key,
    this.onClickTrailer,
    this.onClickHD,
    this.onClickIMDB,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.width,
      color: AppColor.primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                height: 30,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 30,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 8,
                          ),
                          Icon(CupertinoIcons.videocam_fill),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Trailer ",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    SizedBox.expand(child: MaterialButton(onPressed: () {
                      onClickTrailer!();
                    })),
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text(
                          "HD",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                    ),
                    MaterialButton(onPressed: () {
                      onClickHD!();
                    }),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "IMDB: 6.6",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 167, 45),
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}
