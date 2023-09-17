import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

// a class that contains all the app theme data
class AppTheme {
  // colors
  static const Color borderColor = Color(0xFF3A3A3A);
  static const Color borderColor2 = Color(0xFF212121);
  static const Color customBlack = Color(0xFF1A1A1A);
  static const Color textWhite = Color(0xFFFCFCFC);
  static const Color textGray = Color(0xFFD9D9D9);
  static const Color likeButtonBlue = Color(0xFF45FFF4);
  static const Color likeButtonPurple = Color(0xFF7000FF);
  static const Color pink = Color(0xFFFF006B);

  // box decorations
  static BoxDecoration dateCardDecoration = BoxDecoration(
      border: Border.all(color: borderColor, width: 1),
      borderRadius: BorderRadius.circular(20));

  static BoxDecoration chipDecoration = BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: borderColor2, width: 1));

  static BoxDecoration likeButtonDecoration = BoxDecoration(
    color: Colors.black.withOpacity(0.2),
    borderRadius: BorderRadius.circular(100),
    border: const GradientBoxBorder(
      gradient: LinearGradient(
          colors: [likeButtonBlue, likeButtonPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
    ),
  );

  static BoxDecoration likeButton = BoxDecoration(
      color: likeButtonBlue,
      borderRadius: BorderRadius.circular(100),
      border: Border.all(color: borderColor, width: 1));

  //text styles
  static TextStyle normalTextStyle =
      TextStyle(color: textWhite, fontSize: 14, fontWeight: FontWeight.w400);

  static TextStyle normalBoldTextStyle =
      TextStyle(color: textWhite, fontSize: 14, fontWeight: FontWeight.w700);

  static TextStyle numberTextStyle =
      TextStyle(color: textWhite, fontSize: 15, fontWeight: FontWeight.w500);

  static TextStyle ageTextStyle =
      TextStyle(color: textWhite, fontSize: 24, fontWeight: FontWeight.w300);

  static TextStyle titleTextStyle =
      TextStyle(color: textWhite, fontSize: 28, fontWeight: FontWeight.w700);

  static TextStyle subtitleTextStyle =
      TextStyle(color: textGray, fontSize: 15, fontWeight: FontWeight.w300);
}
