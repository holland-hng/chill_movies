import 'package:cached_network_image/cached_network_image.dart';
import 'package:chill_movies/entity/%08movie_entity.dart';
import 'package:flutter/material.dart';

import 'app_size.dart';

class FilmCard extends StatefulWidget {
  final MovieEntity? info;
  const FilmCard({
    Key? key,
    this.info,
  }) : super(key: key);

  @override
  _FilmCardState createState() => _FilmCardState(info);
}

class _FilmCardState extends State<FilmCard> {
  final MovieEntity? _info;

  _FilmCardState(this._info);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: (AppSize.width - 36) / 2,
              height: (AppSize.width - 36) / 2 * 1.5,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: _info?.urlAvatar ?? "",
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                _info?.name ?? "",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${_info?.releaseDate?.split("-")[0]} • ${_info?.duration?.split(" ")[0]}",
                    style: TextStyle(
                      color: Color.fromARGB(255, 167, 167, 167),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Text(
                      "Movie",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox.expand(
          child: MaterialButton(
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
