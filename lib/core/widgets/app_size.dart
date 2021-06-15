import 'package:flutter/material.dart';

class AppSize {
  static double width = 0;
  static double height = 0;
  static double appBar = 0;
  static double tabBar = 0;
  static double statusBar = 0;

  static void config(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;
    AppSize.height = heightScreen;
    AppSize.width = widthScreen;
    AppSize.statusBar = MediaQuery.of(context).padding.top;
    AppSize.appBar = AppSize.statusBar + kToolbarHeight;
    AppSize.tabBar = MediaQuery.of(context).padding.bottom;
  }
}
