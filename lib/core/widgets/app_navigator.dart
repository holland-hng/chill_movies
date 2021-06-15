import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigator {
  static void pop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static void push(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  static void pushReplacement(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static void presentReplacement(BuildContext context, Widget screen) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
        fullscreenDialog: true,
      ),
      (Route<dynamic> route) => false,
    );
  }

  static void present(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      CupertinoPageRoute(
        fullscreenDialog: true,
        builder: (context) => screen,
      ),
    );
  }
}
