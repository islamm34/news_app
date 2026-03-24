import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.white,
      secondary: AppColors.black,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleTextStyle: TextStyle(
        color: AppColors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    tabBarTheme: TabBarThemeData(
      labelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: AppColors.black,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.black,
      ),
      indicatorColor: AppColors.black,
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 26,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.black,
    scaffoldBackgroundColor: AppColors.black,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
      secondary: AppColors.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,

      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColors.black,
      iconTheme: IconThemeData(color: AppColors.white),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    ),
    tabBarTheme: TabBarThemeData(
      overlayColor: WidgetStatePropertyAll(AppColors.white.withAlpha(50)),
      labelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: AppColors.white,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: AppColors.white,
      ),
      indicatorColor: AppColors.white,
    ),
    textTheme: TextTheme(
      displaySmall: TextStyle(
        fontSize: 26,
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        color: AppColors.black,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: AppColors.grey,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
