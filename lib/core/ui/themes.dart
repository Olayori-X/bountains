import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData get lightThemeData => FlexThemeData.light(
      fontFamily: "InstrumentSans",
      useMaterial3: true,
      scheme: FlexScheme.greenM3,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      scaffoldBackground: const Color(0xFFFCFDFD),
      surfaceTint: Colors.transparent,
      appBarElevation: 0.0,
    );

ThemeData get darkThemeData => FlexThemeData.dark(
      fontFamily: "InstrumentSans",
      useMaterial3: true,
      scheme: FlexScheme.greenM3,
      appBarStyle: FlexAppBarStyle.scaffoldBackground,
      scaffoldBackground: const Color(0xFFFCFDFD),
      surfaceTint: Colors.transparent,
      appBarElevation: 0.0,
    );

class AppTextStyles {
  static TextStyle get error => TextStyle(
        fontSize: 12.sp,
        height: (14 / 12),
        fontWeight: FontWeight.w300,
      );

  static TextStyle get buttonText => TextStyle(
        fontSize: 35.sp,
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      );

  static TextStyle get littlebuttonText => TextStyle(
        fontSize: 20.sp,
        height: (30 / 20),
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      );

  static TextStyle get titleText => TextStyle(
        fontSize: 32.sp,
        height: (38.73 / 32),
        fontFamily: "Poppins",
        fontWeight: FontWeight.bold,
      );

  static TextStyle get body1SemiBold => TextStyle(
        fontSize: 12.sp,
        height: (18 / 12),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get body1Bold => TextStyle(
        fontSize: 12.sp,
        height: (18 / 12),
        fontWeight: FontWeight.w700,
      );

  static TextStyle get body2SemiBold => TextStyle(
        fontSize: 11.sp,
        height: (16.5 / 11),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get body1Medium => TextStyle(
        fontSize: 12.sp,
        height: (18 / 12),
        fontWeight: FontWeight.w500,
      );

  static TextStyle get title1 => TextStyle(
        fontSize: 16.sp,
        height: (24 / 16),
        fontWeight: FontWeight.w400,
      );

  static TextStyle get title1Medium => TextStyle(
        fontSize: 20.sp,
        height: (24.2 / 20),
        fontWeight: FontWeight.w500,
      );

  static TextStyle get title1SemiBold => TextStyle(
        fontSize: 16.sp,
        height: (24 / 16),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get title1Bold => TextStyle(
        fontSize: 16.sp,
        height: (24 / 16),
        fontWeight: FontWeight.w700,
      );

  static TextStyle get title2 => TextStyle(
        fontSize: 14.sp,
        height: (21 / 14),
        fontWeight: FontWeight.w400,
      );

  static TextStyle get title2Medium => TextStyle(
        fontSize: 14.sp,
        height: (16.44 / 14),
        fontWeight: FontWeight.w500,
      );

  static TextStyle get title2Semibold => TextStyle(
        fontSize: 14.sp,
        height: (16.44 / 14),
        fontWeight: FontWeight.w600,
      );

  static TextStyle get title2Bold => TextStyle(
        fontSize: 14.sp,
        height: (21 / 14),
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h3Bold => TextStyle(
        fontSize: 30.sp,
        height: (45 / 30),
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h2Bold => TextStyle(
        fontSize: 28.sp,
        height: (32.87 / 28),
        fontWeight: FontWeight.w700,
      );

  static TextStyle get h4Bold => TextStyle(
        fontSize: 20.sp,
        height: (30 / 20),
        fontWeight: FontWeight.w700,
      );
}
