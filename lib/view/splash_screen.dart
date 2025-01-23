import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value) {
      // ignore: use_build_context_synchronously
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(builder: (context) => MainScreen()));
      // Get.offAll(() => MainScreen());
      Get.offAndToNamed(NamedRuote.routeMainScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBg,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.splashSc.path,
                height: 64,
              ),
              const SizedBox(
                height: 32,
              ),
              const Loading()
            ],
          ),
        ),
      ),
    );
  }
}
