import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/splash_screen.dart';

void main() {
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
          textTheme: TextTheme(
            displayLarge: TextStyle(
              fontFamily: 'dana',
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
            titleMedium: TextStyle(
              fontFamily: 'dana',
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            bodyLarge: TextStyle(
                fontFamily: 'dana', fontSize: 13, fontWeight: FontWeight.w300),
            displayMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w300),
            displaySmall: TextStyle(
                fontFamily: 'dana', fontSize: 14, fontWeight: FontWeight.w700),
            headlineMedium: TextStyle(
                fontFamily: 'dana',
                fontSize: 14,
                color: Color.fromARGB(255, 70, 70, 70),
                fontWeight: FontWeight.w700),
            headlineSmall: TextStyle(
                fontFamily: 'dana', fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
        home: SplashScreen(),
        
        );
  }
}
