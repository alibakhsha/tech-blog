import 'package:flutter/material.dart';
import 'package:tech_blog/constatnt/my_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)))),
        textStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return const TextStyle(
              fontSize: 16,
              fontFamily: 'dana',
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle,
            );
          }
          return const TextStyle(
            fontSize: 15,
            fontFamily: 'dana',
            fontWeight: FontWeight.w300,
            color: SolidColors.posterSubTitle,
          );
        }),
        backgroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.pressed)) {
            return SolidColors.seeMore;
          }
          return SolidColors.primaryColor;
        }),
      ),
    ),
    fontFamily: 'dana',
    brightness: Brightness.light,
    hintColor: SolidColors.primaryColor,
    textTheme: const TextTheme(
      titleLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black),
      displayLarge: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: SolidColors.posterTitle),
      titleMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: SolidColors.posterSubTitle),
      bodyLarge: TextStyle(
          fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
      displayMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w300),
      displaySmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: SolidColors.seeMore,
          fontWeight: FontWeight.w700),
      headlineMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Color.fromARGB(255, 70, 70, 70),
          fontWeight: FontWeight.w700),
      labelMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          color: Color.fromARGB(255, 72, 72, 72),
          fontWeight: FontWeight.w700),
      headlineSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: SolidColors.hintText,
          fontWeight: FontWeight.w700),
      labelSmall: TextStyle(
          fontFamily: 'dana',
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.w700),
      bodyMedium: TextStyle(
          fontFamily: 'dana',
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w700),
    ),
  );
}
