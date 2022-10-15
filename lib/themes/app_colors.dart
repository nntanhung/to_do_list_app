import 'package:flutter/material.dart';

class AppColors {

  static const backgroundColor = Color(0xFFF0F0F0);
  static const appColor = Color(0xFFF79E89);
  static const primaryLightRed = Color(0xFFF76C6A);
  static const primaryBlack = Color(0xFF272727);
  static const primaryBlack80 = Color(0x80272727);
  static const primaryWhite = Color(0xFFFFFFFF);
  static const primaryGrey = Color(0xFF949494);
  static Color get accentColor => Colors.deepOrange;
  static Color get red2 => Color(0xFFD51840);

  static const shadowColor = Color.fromRGBO(0, 0, 0, 0.05);


  ///BEGIN -- New UI COLOR
  static const gradientGreen1 = Color(0xFF2DA04B);
  static const gradientGreen2 = Color(0xFF53C670);
  static const greenLight = Color(0xFFE7FFE5);

  ///END -- New UI COLOR
static const Color materialOrange = Color.fromRGBO(255, 171, 64, 1);
  static const Color materialPink = Color.fromRGBO(255, 64, 129, 1);
  static List<List<Color>> dotLoadingColor = [
    [materialOrange, materialOrange],
    [materialOrange, materialPink],
    [materialOrange, materialPink],
    [materialOrange, materialPink],
    [materialOrange, materialPink],
    [materialPink, materialPink]
  ];

}
