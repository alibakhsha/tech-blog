import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tech_blog/component/my_component.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/component/my_colors.dart';
import 'package:tech_blog/view/main_screen.dart';

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
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
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
