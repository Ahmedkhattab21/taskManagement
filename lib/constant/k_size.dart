

import 'package:flutter/material.dart';

class KSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
    orientation = _mediaQueryData.orientation;
  }


  static double getWidth(BuildContext context,width) {
    KSize.init(context);
    double screenWidth = KSize.screenWidth;
    return (width / 375) * screenWidth;
  }

  static double getHeight(BuildContext context,height) {
    KSize.init(context);
    double screenHeight = KSize.screenHeight;
    return (height / 812) * screenHeight;
  }
}