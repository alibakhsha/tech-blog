import 'package:flutter/material.dart';
import 'package:tech_blog/my_colors.dart';

class techDivider extends StatelessWidget {
  const techDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 1,
      color: solidColors.dividerColor,
      indent: size.width/6,
      endIndent: size.width/6,
    );
  }
}
