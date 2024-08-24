import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/view/home_scrren.dart';
import 'package:tech_blog/view/profile_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: solidColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Icon(Icons.menu),
            Image.asset(
              Assets.images.logo.path,
              height: size.height / 13.6,
            ),
            const Icon(Icons.search)
          ],
        ),
      ),
      backgroundColor: solidColors.scaffoldBg,
      body: Stack(
        children: [
          Center(
              child: Positioned.fill(
                  child: IndexedStack(
                    index: selectedPageIndex,
                    children: [
                      homeScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                      ProfileScreen(size: size, textTheme: textTheme, bodyMargin: bodyMargin)
                    ],
                  ))),
          bottomNavigation(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              setState(() {
                selectedPageIndex = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class bottomNavigation extends StatelessWidget {
  const bottomNavigation({
    super.key,
    required this.size,
    required this.bodyMargin,
    required this.changeScreen,
  });

  final Size size;
  final double bodyMargin;
  final Function(int) changeScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 11.5,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradientColors.bottomNavBackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                  colors: GradientColors.bottomNav,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (() => changeScreen(0)),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.homebtn.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: ImageIcon(
                      AssetImage(Assets.icons.wbtn.path),
                      color: Colors.white,
                    )),
                IconButton(
                    onPressed: (() => changeScreen(1)),
                    icon: ImageIcon(
                      AssetImage(Assets.icons.userbtn.path),
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
