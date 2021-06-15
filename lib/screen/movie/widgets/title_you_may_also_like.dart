import 'package:flutter/material.dart';

class TitleYouMayAlsoLike extends StatelessWidget {
  const TitleYouMayAlsoLike({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, top: 30, bottom: 15),
      child: Text(
        "You may also like",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
      ),
    );
  }
}
