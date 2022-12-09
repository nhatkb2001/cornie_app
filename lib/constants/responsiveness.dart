import 'package:flutter/cupertino.dart';

//init the size of any screen
const int largeScreenSize = 1366;
const int mediumScreenSize = 768;
const int smallScreenSize = 360;
// const int customScreenSize = 1100;

class responsiveWidget extends StatelessWidget {
  const responsiveWidget({
    Key? key,
    required this.largeScreen,
    required this.mediumScreen,
    required this.smallScreen,
    // required this.customScreen
  }) : super(key: key);
  //init the widget
  final Widget largeScreen;
  final Widget mediumScreen;
  final Widget smallScreen;
  // final Widget customScreen;

  //init the condition
  static bool isSmallScreen(BuildContext context) =>
      MediaQuery.of(context).size.width < mediumScreenSize;
  static bool isLargeScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= largeScreenSize;
  static bool isMediumScreen(BuildContext context) =>
      MediaQuery.of(context).size.width >= mediumScreenSize &&
      MediaQuery.of(context).size.width < largeScreenSize;
  // static bool isCustomScreen(BuildContext context) =>
  //     MediaQuery.of(context).size.width >= mediumScreenSize &&
  //     MediaQuery.of(context).size.width <= customScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      double _width = constraints.maxWidth;
      if (_width >= largeScreenSize) {
        return largeScreen;
      } else if (_width < largeScreenSize && _width >= mediumScreenSize) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}
