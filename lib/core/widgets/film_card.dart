import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_size.dart';

class FilmCard extends StatefulWidget {
  const FilmCard({
    Key? key,
  }) : super(key: key);

  @override
  _FilmCardState createState() => _FilmCardState();
}

class _FilmCardState extends State<FilmCard> {
  _FilmCardState();
  EdgeInsetsGeometry? _magin;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: (AppSize.width - 36) / 2,
          height: (AppSize.width - 36) / 2 * 1.5,
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl:
                "https://img.himovies.to/resize/180x270/69/da/69daeeaabc72389010331464e8cda51e/69daeeaabc72389010331464e8cda51e.jpg",
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
          ),
          child: Text(
            "Fast & Furious",
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
                "2012 • 91m",
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
    );
  }
}
