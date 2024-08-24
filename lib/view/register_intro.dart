import 'package:flutter/material.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class RegisterIntro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
             Image.asset(Assets.images.techBlog.path)
            ],
          ),
        ),
      ) 
    
    
    );
  }
}
