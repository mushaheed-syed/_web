import 'package:flutter/widgets.dart';

class AppImagesPath {
  static const String cover = 'assets/images/cover.r2.png';
  static const String logo = 'assets/images/logo.png';
  static const String logoTransparent = 'assets/images/logo_transparent.png';
}

class TechImagePath {
  static const String _base = 'assets/images/tech';
  static const String kotlin = '$_base/kotlin.png';
  static const String django = '$_base/django.png';
  static const String flutter = '$_base/flutter.jpg';
  static const String firebase = '$_base/firebase.png';
  static const String nodejs = '$_base/nodejs.png';
  static const String vuejs = '$_base/vue.png';
  static const String reactjs = '$_base/reactjs.png';
}

class AppImages {
  static const AssetImage cover = AssetImage(AppImagesPath.cover);
  static const AssetImage logo = AssetImage(AppImagesPath.logo);
  static const AssetImage logoTransparent =
      AssetImage(AppImagesPath.logoTransparent);
}
