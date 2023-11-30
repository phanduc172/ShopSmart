import 'package:flutter/material.dart';
import 'package:shop_smart/consts/app_color.dart';

class Styles {
  static ThemeData themeData({required bool isDarkTheme, required BuildContext context}) {
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme
          ? AppColors.darkScaffoldColor
          : AppColors.lightScaffoldColor,
      cardColor: isDarkTheme
        ? const Color.fromARGB(255, 13, 6, 37)
          : AppColors.lightScaffoldColor,
    );
  }
}