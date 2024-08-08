import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/main_screen.dart';
import 'package:tec/my_colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
        
        builder: (context)=> MainScreen())
        
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.images.splashSc.path,
                height: 64,
              ),
              SizedBox(
                height: 32,
              ),
              SpinKitFadingCube(
                color: solidColors.primaryColor,
                size: 32.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}
