import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ImageAssets {
  static const String _pathPrefix = 'assets/images/png';
  static const String _pathPrefixAuth = 'assets/images/authentication';
  static const String _pathPrefixLogo = 'assets/images/logo';
  static const String _pathPrefixBackground = 'assets/images/background';

  // START FROM HERE
  static const String example_png = '$_pathPrefix/example_png.png';
  static const String homebg_png = '$_pathPrefix/main_home.png';
  static const String filter_png = '$_pathPrefix/filter.png';
  static const String post_png = '$_pathPrefix/im_post.png';
  static const String backgroundOnboarding =
      '$_pathPrefix/backgroundOnboarding.png';
  static const String salySayhi = '$_pathPrefixAuth/salySayhi.png';
  static const String googleIcon = '$_pathPrefixAuth/googleIcon.png';
  static const String facebookIcon = '$_pathPrefixAuth/facebookIcon.png';
  static const String iconApp2 = '$_pathPrefixLogo/logoApp2.png';
  static const String iconApp = '$_pathPrefixLogo/logoApp.png';
}

// Contains vector image(svg)
class VectorImageAssets {
  static const String _pathPrefix = 'assets/images/svg';

  // START FROM HERE
  static const String example_svg = '$_pathPrefix/example_svg.svg';
  static const String filter_svg = '$_pathPrefix/filtter.svg';
}
