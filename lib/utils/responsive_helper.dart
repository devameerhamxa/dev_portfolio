import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 768;
  }

  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width >= 768 &&
        MediaQuery.of(context).size.width < 1024;
  }

  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1024;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static EdgeInsets getPadding(BuildContext context) {
    if (isMobile(context)) {
      return const EdgeInsets.symmetric(horizontal: 20, vertical: 10);
    } else if (isTablet(context)) {
      return const EdgeInsets.symmetric(horizontal: 40, vertical: 20);
    } else {
      return const EdgeInsets.symmetric(horizontal: 80, vertical: 40);
    }
  }

  static double getAppBarHeight(BuildContext context) {
    return isMobile(context) ? 70 : 80;
  }

  static double getNavFontSize(BuildContext context) {
    if (isMobile(context)) return 12;
    if (isTablet(context)) return 13;
    return 14;
  }

  static double getLogeFontSize(BuildContext context) {
    return isMobile(context) ? 20 : 24;
  }
}
