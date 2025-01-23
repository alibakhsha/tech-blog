import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tech_blog/binding.dart';
import 'package:tech_blog/constatnt/my_colors.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tech_blog/component/themes.dart';
import 'package:tech_blog/my_http_overrides.dart';
import 'package:tech_blog/view/aticle/manage_article.dart';
import 'package:tech_blog/view/aticle/single_manage_article.dart';
import 'package:tech_blog/view/main_screen/main_screen.dart';
import 'package:tech_blog/view/aticle/single_article.dart';
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
      // initialBinding: RegisterBinding(),
      locale: const Locale('fa'),
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      getPages: [
        GetPage(name: NamedRuote.routeMainScreen, page: () => MainScreen(), binding: RegisterBinding()),
        GetPage(name: NamedRuote.routeSingleArticle, page: () => Single(), binding: ArticleBinding()),
        GetPage(
          name: NamedRuote.manageArticle, 
          page: () => ManageArticle(), 
          binding: ArticleManagerBinding()),
        GetPage(
          name: NamedRuote.singleManageArticle, 
          page: () => SingleManageArticle(), 
          binding: ArticleManagerBinding()),
      ],
      home: const SplashScreen(),
    );
  }
}

class NamedRuote {
  static String routeMainScreen = "/MainScreen";
  static String routeSingleArticle = "/SingleArticle";
  static String manageArticle = "/ManageArticle";
  static String singleManageArticle = "/SingleManageArticle";
}
