import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class KSize {
  static double getWidth(BuildContext context, wwidth) {
    double width = (((100 / 375) * wwidth) / 100) * context.screenWidth;
    return width;
  }

  static double getHeight(BuildContext context, hheight) {
    double height = (((100 / 812) * hheight) / 100) * context.screenHeight;
    return height;
  }
}