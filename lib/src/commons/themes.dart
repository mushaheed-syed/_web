import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'strings.dart';

class AppTheme {
  static const TextTheme textTheme = TextTheme(
    headline1: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 99,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    headline2: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 62,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
    ),
    headline3: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 49,
      fontWeight: FontWeight.w400,
    ),
    headline4: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 35,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    headline5: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 25,
      fontWeight: FontWeight.w400,
    ),
    headline6: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 21,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
    ),
    subtitle1: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
    ),
    subtitle2: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
    ),
    bodyText1: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
    ),
    bodyText2: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    button: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    caption: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
    ),
    overline: TextStyle(
      fontFamily: Strings.fontFamily,
      fontSize: 10,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
    ),
  );
}

class AppColors {
  /// Jet
  static const Color jet = Color(0xFF2F2F2F);

  /// purple
  static const Color purple = Color(0xE6800080);

  /// Purple material color
  static const Color purpleMaterial = Color(0xE0800080);

  /// violet
  static const Color violet = Color(0xE6470080);

  /// violet material color
  static const Color violetMaterial = Color(0xE0470080);

  /// Light Gray
  static const Color lightGray = Color(0xFFDBDBDB);

  static const Color lightGrayMaterial = Color(0xBFDBDBDB);

  /// Dark Gray
  static const Color darkGray = Color(0xFF9C9C9C);

  static const Color darkGrayMaterial = Color(0xBF9C9C9C);

  /// Opacity of gray material
  static const double grayMaterialOpacity = 0.75;

  /// Light purple
  static const Color lightPurple = Color(0xFF790A7D);

  /// Dark purple
  static const Color darkPurple = Color(0xFF520A7D);

  /// Opacity of purple material
  static const double purpleMaterialOpacity = 0.88;
}
