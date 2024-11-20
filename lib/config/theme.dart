import 'package:flutter/material.dart';
import 'constants/colors.dart';

class MyTheme {
  MyTheme._();

  // Light Theme Configuration
  static ThemeData get lightTheme {
    final scheme = ColorScheme.fromSeed(
      seedColor: ColorConst.lightAccent,
      brightness: Brightness.light,
      surface: ColorConst.lightCardBackground,
      onSurface: ColorConst.lightTextPrimary,
    );

    return ThemeData(
      brightness: Brightness.light,
      //scaffoldBackgroundColor: ColorConst.lightBackground,
      colorScheme: scheme,
      cardTheme: CardTheme(
        color: ColorConst.white,
        elevation: 2,
        //   surfaceTintColor: ColorConst.lightAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          // side: BorderSide(color: ColorConst.lightBorder),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConst.lightCardBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorConst.lightTextPrimary),
        titleTextStyle: TextStyle(
          color: ColorConst.lightTextPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: ColorConst.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        ),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          color: ColorConst.lightTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: ColorConst.lightTextSecondary),
      ),
      dividerColor: ColorConst.lightBorder,
    );
  }

  // Dark Theme Configuration
  static ThemeData get darkTheme {
    final darkScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: ColorConst.darkAccent,
      onPrimary: ColorConst.darkTextPrimary,
      secondary: ColorConst.darkAccent,
      onSecondary: ColorConst.darkTextPrimary,
      surface: ColorConst.darkCardBackground,
      onSurface: ColorConst.darkTextPrimary,
      error: Colors.redAccent,
      onError: Colors.white,
    );

    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorConst.darkBackground,
      colorScheme: darkScheme,
      cardTheme: CardTheme(
        //  color: ColorConst.darkCardBackground,
        elevation: 10,
        //  surfaceTintColor: ColorConst.darkAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorConst.darkCardBackground,
        elevation: 0,
        iconTheme: IconThemeData(color: ColorConst.darkTextPrimary),
        titleTextStyle: TextStyle(
          color: ColorConst.darkTextPrimary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: darkScheme.primary,
          foregroundColor: ColorConst.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        ),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          color: ColorConst.darkTextPrimary,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(color: ColorConst.darkTextSecondary),
      ),
      dividerColor: ColorConst.darkBorder,
    );
  }
}
