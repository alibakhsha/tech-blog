import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screen_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:url_launcher/url_launcher.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: SolidColors.dividerColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({
    super.key,
    required this.textTheme,
    required this.index,
  });

  final TextTheme textTheme;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(24)),
            gradient: LinearGradient(
                colors: GradientColors.tags,
                begin: Alignment.centerRight,
                end: Alignment.centerLeft)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          child: Row(
            children: [
              ImageIcon(
                AssetImage(Assets.icons.hashtagicon.path),
                color: Colors.white,
                size: 16,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                Get.find<HomeScreenController>().tagsList[index].title!,
                style: textTheme.labelSmall,
              )
            ],
          ),
        ));
  }
}

myLaunchUrl(String url) async {
  var uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    debugPrint("could not launch ${uri.toString()}");
  }
}

class Loading extends StatelessWidget {
  const Loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      color: SolidColors.primaryColor,
      size: 32.0,
    );
  }
}

PreferredSize appBar(String title, TextTheme textTheme) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: Padding(
      padding: const EdgeInsets.all(12),
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Center(
                child: Text(
              title,
              style: textTheme.titleLarge,
            )),
          )
        ],
        leading: Padding(
          padding: const EdgeInsets.only(right: 16),
          child: GestureDetector(
            onTap: ()=> Get.back(),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: SolidColors.primaryColor.withAlpha(100),
                  shape: BoxShape.circle),
              child: const Icon(
                Icons.keyboard_arrow_right_rounded,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
