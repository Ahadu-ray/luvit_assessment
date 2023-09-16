import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';

class AppTheme {
  // colors
  static const Color borderColor = Color(0xFF3A3A3A);
  static const Color borderColor2 = Color(0xFF212121);
  static const Color customBlack = Color(0xFF1A1A1A);
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

  static BoxDecoration tagHolderDecoration = BoxDecoration(
    color: Colors.black.withOpacity(0.2),
    borderRadius: BorderRadius.circular(100),
    border: const GradientBoxBorder(
      gradient: LinearGradient(
          colors: [likeButtonBlue, likeButtonPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight),
    ),
  );

  //text styles
  static TextStyle normalTextStyle =
      TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500);
}
