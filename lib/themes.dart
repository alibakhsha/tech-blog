import 'package:flutter/material.dart';
import 'package:tech_blog/my_colors.dart';

var themeData = ThemeData(
  fontFamily: 'dana',
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontFamily: 'dana',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: solidColors.posterTitle),
    titleLarge: TextStyle(
      fontFamily: 'dana',
      fontSize: 18,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: solidColors.posterSubTitle),
    bodyLarge: TextStyle(
        fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
    displayMedium: TextStyle(
        fontFamily: 'dana', fontSize: 16, fontWeight: FontWeight.w700),
    displaySmall: TextStyle(
        fontFamily: 'dana',
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: solidColors.primaryColor),
    bodyMedium: TextStyle(
      fontFamily: 'dana',
      fontSize: 16,
      color: solidColors.welcomeColor,
    ),
    headlineLarge: TextStyle(
      fontFamily: 'dana',
      fontSize: 16,
      color: Colors.white,
    ),
    headlineMedium: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        color: solidColors.seeMore,
        fontWeight: FontWeight.w700),
    headlineSmall: TextStyle(
        fontFamily: 'dana',
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: Colors.white),
  ),
);
