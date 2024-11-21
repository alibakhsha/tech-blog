import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/themes.dart';
import 'package:tech_blog/my_http_overrides.dart';
import 'package:tech_blog/view/splash_screen.dart';

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColors.systemNavigationBarColor));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: RegisterBinding(),
      locale: const Locale('fa'),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      home: const SplashScreen(),
    );
  }
}
