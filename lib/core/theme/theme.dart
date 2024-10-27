import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:possible/core/extension/number.extention.dart';
import 'package:possible/core/theme/colors.dart';

class AdaptiveFontSize {
  static double getFontSize(BuildContext context, double baseFontSize) {
    double screenWidth = MediaQuery.of(context).size.width;
    const double baseScreenWidth = 375.0; // Standard screen width
    double scaleFactor = screenWidth / baseScreenWidth;
    return baseFontSize * scaleFactor;
  }
}

themeData(BuildContext context) => ThemeData(
      scaffoldBackgroundColor: Palette.background,
      textTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Montserrate',
            bodyColor: Colors.black,
            displayColor: Colors.black,
            fontSizeFactor: 1.sp,
          ),
      primaryTextTheme: Theme.of(context).textTheme.apply(
            fontFamily: 'Montserrate',
            bodyColor: Colors.black,
            displayColor: Colors.black,
            fontSizeFactor: 1.sp,
          ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        errorBorder: InputBorder.none,
        fillColor: Palette.white,
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w500,
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 5.0,
        ),

        enabledBorder: kInputBorder,
        border: kInputBorder,
        focusedBorder: kInputBorder,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Palette.background,
        surfaceTintColor: Colors.transparent,
      ),
      colorScheme: const ColorScheme.light(
        surface: Palette.background,
        primary: Palette.primary,
        tertiary: Palette.background,
      ),
    );

OutlineInputBorder kInputBorder = OutlineInputBorder(
  borderRadius: 50.radius,
  borderSide: BorderSide.none,
);
