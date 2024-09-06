
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
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
                tagList[index].title!,
                style: textTheme.headlineSmall,
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
    print("could not launch ${uri.toString()}");
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
