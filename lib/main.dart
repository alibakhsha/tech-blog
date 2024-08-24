import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/home_scrren.dart';
import 'package:tech_blog/view/register_intro.dart';
import 'package:tech_blog/view/splash_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: solidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: solidColors.systemNavigationBarColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa'), // Farsi
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
      ),
      home: RegisterIntro(),
    );
  }
}
