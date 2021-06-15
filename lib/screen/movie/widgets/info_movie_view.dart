import 'package:flutter/material.dart';

class InfoMovieView extends StatelessWidget {
  final String? title;
  final String? content;
  const InfoMovieView({
    Key? key,
    this.title,
    this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 5, right: 15),
      child: RichText(
        textAlign: TextAlign.start,
        text: TextSpan(
          style: TextStyle(fontFamily: "Quicksand"),
          children: [
            TextSpan(
              text: title! + ":",
              style:
                  TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
            ),
            TextSpan(
              text: " " + content!,
              style: TextStyle(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
