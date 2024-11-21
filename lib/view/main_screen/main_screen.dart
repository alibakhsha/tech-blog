import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/api_constant.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/component/my_string.dart';
import 'package:tech_blog/controller/register_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/services/dio_service.dart';
import 'package:tech_blog/view/main_screen/home_scrren.dart';
import 'package:tech_blog/view/main_screen/profile_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({super.key});
  @override
  Widget build(BuildContext context) {
    DioService().getMethod(ApiConstant.getHomeItems);
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodyMargin = size.width / 10;

    return Scaffold(
      key: _key,
      drawer: Drawer(
        backgroundColor: SolidColors.scaffoldBg,
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: ListView(
            children: [
              DrawerHeader(
                  child: Image.asset(
                Assets.images.logo.path,
                scale: 3,
              )),
              ListTile(
                onTap: () {},
                title: Text(
                  "پروفایل کاربری",
                  style: textTheme.headlineMedium,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () {},
                title: Text(
                  "درباره تک‌بلاگ",
                  style: textTheme.headlineMedium,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () async {
                  await Share.share(MyString.shareText);
                },
                title: Text(
                  "اشتراک گذاری تک بلاگ",
                  style: textTheme.headlineMedium,
                ),
              ),
              const Divider(
                color: SolidColors.dividerColor,
              ),
              ListTile(
                onTap: () {
                  myLaunchUrl(MyString.techBlogGithubUrl);
                },
                title: Text(
                  "تک‌بلاگ در گیت هاب",
                  style: textTheme.headlineMedium,
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColors.scaffoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: const Icon(Icons.menu)),
            Image.asset(
              Assets.images.logo.path,
              height: size.height / 13.6,
            ),
            const Icon(Icons.search)
          ],
        ),
      ),
      backgroundColor: SolidColors.scaffoldBg,
      body: Stack(
        children: [
          Positioned.fill(
              child: Obx(
            () => IndexedStack(
              index: selectedPageIndex.value,
              children: [
                HomeScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin),
                ProfileScreen(
                    size: size, textTheme: textTheme, bodyMargin: bodyMargin)
              ],
            ),
          )),
          BottomNavigation(
            size: size,
            bodyMargin: bodyMargin,
            changeScreen: (int value) {
              selectedPageIndex.value = value;
            },
          ),
        ],
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
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
      bottom: 8,
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
                    onPressed: () {
                      //TODO Check Login Status
                      // Get.to(RegisterIntro());
                      Get.find<RegisterController>().toggleLogin();
                    },
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
