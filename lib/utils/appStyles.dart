import 'package:flutter/material.dart';
import 'package:islami_app/utils/appColors.dart';

abstract class AppStyles {
  static TextStyle appBarText = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 30, color: AppColors.accent);
  static TextStyle semibold = const TextStyle(
      fontWeight: FontWeight.w600, fontSize: 25, color: AppColors.accent);
  static TextStyle regular = const TextStyle(
      fontWeight: FontWeight.w400, fontSize: 25, color: AppColors.accent);

  //light theme
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      titleTextStyle: AppStyles.appBarText ,
    ),
    textTheme: TextTheme(
      titleLarge: AppStyles.semibold,
      titleMedium: AppStyles.regular,
    ),
  );


  //dark theme
  static ThemeData darkTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      titleTextStyle: AppStyles.appBarText.copyWith(color: AppColors.white) ,
    ),
    textTheme: TextTheme(
      titleLarge: AppStyles.semibold.copyWith(color: AppColors.white),
      titleMedium: AppStyles.regular.copyWith(color: AppColors.white),
    ),
  );
}
