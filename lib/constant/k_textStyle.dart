
import 'package:flutter/material.dart';

import 'my_colors.dart';


class KTextStyle {
  //Headline
  static const TextStyle headline1 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 96,
    fontWeight: FontWeight.normal, //light
    // letterSpacing: -1.5,
  );
  static const TextStyle headline2 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 60,
    fontWeight: FontWeight.normal, //light
    // letterSpacing: -0.5,
  );
  static const TextStyle headline3 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 48,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 0,
  );
  static const TextStyle headline4 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 34,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 0.25,
  );
  static const TextStyle headline5 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 24,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 0,
  );
  static const TextStyle headline6 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 20,
    fontWeight: FontWeight.w600, //Medium
    // letterSpacing: 0.15,
  );

  /// Subtitle
  static const TextStyle subtitle1 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 0.15,
  );
  static const TextStyle subtitle2 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 14,
    fontWeight: FontWeight.w600, //Medium
    // letterSpacing: 0.1,
  );

  /// Section Title
  static const TextStyle sectionTitle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
    height: 20 / 18,
    color: KColor.eerieBlack,
  );

  /// Body
  static const TextStyle body1 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 16,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 0.5,
  );
  static const TextStyle body2 = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 14,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 0.25,
  );

  /// Appbar
  static const TextStyle appBar = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: KColor.eerieBlack,
    height: 18 / 16,
  );

  /// BUTTON
  static const TextStyle button = TextStyle(
    color: KColor.white,
    fontSize: 14,
    fontWeight: FontWeight.w600, //Medium
    // letterSpacing: 1.25,
  );

  /// Caption
  static const TextStyle caption = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 12,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 0.4,
  );
  static const TextStyle caption2 = TextStyle(
    color: KColor.blackCoffee,
    fontWeight: FontWeight.w600,
    fontSize: 12,
    decoration: TextDecoration.underline,
    // letterSpacing: 0.0
  );

  /// OVERLINE
  static const TextStyle overline = TextStyle(
    color: KColor.eerieBlack,
    fontSize: 10,
    fontWeight: FontWeight.w400, // Normal
    // letterSpacing: 1.5,
  );
}
