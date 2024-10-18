import 'package:flutter/material.dart';
import 'package:scelloo_blog_app/core/app_colors.dart';

class UtilityClass {
  static EdgeInsets horizontalPadding =
      const EdgeInsets.symmetric(horizontal: 20);

  static EdgeInsets horizontalAndVerticalPadding =
      const EdgeInsets.symmetric(horizontal: 20, vertical: 20);

  static final buttonDecorationFill = BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primaryColor,
        AppColors.primaryColor,
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(25),
  );

  static BoxDecoration setButtonDecoration(Color color) {
    return BoxDecoration(
      border: Border.all(color: color, width: 2),
      color: color,
      borderRadius: BorderRadius.circular(25),
    );
  }

  static TextStyle titleTextStyle = const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle bodyTextStyle = const TextStyle(fontSize: 13, fontWeight: FontWeight.normal);

}
