import 'package:flutter/material.dart';
import '../../styles/dimens.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static String get _fontFamily => 'BebasNeue';
  static PageTransitionsTheme get _pageTransitions =>
      const PageTransitionsTheme(
        builders: <TargetPlatform, PageTransitionsBuilder>{
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      );

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        pageTransitionsTheme: _pageTransitions,
        fontFamily: _fontFamily,
        primaryColor: AppColors.primaryWhite,
        scaffoldBackgroundColor: AppColors.primaryWhite,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          elevation: Dimens.elevation,
          centerTitle: true,
          color: AppColors.primaryWhite,
        ),

        iconTheme: IconThemeData(
          color: AppColors.primaryBlack80,
        ),
        
        textTheme: const TextTheme(
          caption: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 14.0,
            fontWeight: FontWeight.w600,
          ),

          bodyText2: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            fontFamily: 'Montserrat'
          ),

          bodyText1: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'
          ),

          subtitle2: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: Dimens.size11,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat'
          ),

          subtitle1: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: Dimens.size16,
            fontWeight: FontWeight.w600,
          ),

          /// For button
          button: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: Dimens.size14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat'
          ),

          headline6: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: Dimens.size12,
            fontWeight: FontWeight.w400,
            fontFamily: 'Montserrat',
          ),

          headline5: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: Dimens.size16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Montserrat',
          ),

          headline4: TextStyle(
            color: AppColors.primaryBlack,
            fontSize: Dimens.size26,
            fontWeight: FontWeight.w400,
            fontFamily: 'BebasNeue'
          ),

          headline3: TextStyle(
            color: AppColors.primaryLightRed,
            fontSize: Dimens.size36,
            fontWeight: FontWeight.w400,
            fontFamily: 'BebasNeue'
          ),

          headline2: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: Dimens.size45,
            fontWeight: FontWeight.w400,
            fontFamily: 'BebasNeue'
          ),

          headline1: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: Dimens.size73,
            fontWeight: FontWeight.w600,
            fontFamily: 'BebasNeue'
          ),
        ),

        primaryTextTheme: const TextTheme(
          caption: TextStyle(
            color: AppColors.primaryWhite,
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
          ),
        ),
        
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.primaryWhite,
        ),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primaryLightRed,
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        pageTransitionsTheme: _pageTransitions,
        fontFamily: _fontFamily,
      );
}
