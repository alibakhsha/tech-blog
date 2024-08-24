import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/my_colors.dart';
import 'package:tech_blog/my_component.dart';
import 'package:tech_blog/my_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodyMargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodyMargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            Assets.images.userProfile.path,
            height: 100,
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(Assets.icons.bluepen.path),
                color: solidColors.seeMore,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(MyString.imageProfileEdit,
                  style: Theme.of(context).textTheme.headlineMedium)
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "فاطمه امیری",
            style: textTheme.displaySmall,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            "fatemeamiri@gmail.com",
            style: textTheme.displayMedium,
          ),
          const SizedBox(
            height: 40,
          ),
          techDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: solidColors.primaryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyString.myFavBlog,
                    style: textTheme.displayMedium,
                  ),
                )),
          ),
          techDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: solidColors.primaryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyString.myFavPodcast,
                    style: textTheme.displayMedium,
                  ),
                )),
          ),
          techDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: solidColors.primaryColor,
            child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyString.logOut,
                    style: textTheme.displayMedium,
                  ),
                )),
          ),

          const SizedBox(
            height: 160,
          ),
        ],
      )),
    );
  }
}