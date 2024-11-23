import 'package:flutter/material.dart';

class AppColors {
  static Color get primary => const Color(0xFF02827C);
  static Color get primary2Lighter => const Color(0xFFB2BBC6);
  static Color get primary2Light => const Color(0xFF909DAD);
  static Color get primary2Normal => const Color(0xFFEBEEF2);
  static Color get primary2Normal2 => const Color(0xFF546881);
  static Color get primary2Dark => const Color(0xFF090B0E);
  static Color get background => const Color(0xFF012E2B);
  static Color get secondary => const Color(0xFFC45203);
  static Color get disabledButton => const Color(0xFFF6F8F9);
  static Color get tertiary => const Color(0xFF061F37);
  static Color get hint => const Color(0xFFB2BBC6);
  static Color get border => const Color(0xFFE5E5E5);
  static Color get error => const Color(0xFFFB5555);
  static Color get primary2Dark2 => const Color(0xFF1D242D);
  static Color get viewButtonColor => const Color(0xFFF9FAFB);
  static LinearGradient get backgroundColor => const LinearGradient(
        colors: [
          Color(0xFFC0392B),
          Color(0xFFFFE6DB),
        ],
        stops: [0.55, 0.99],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      );

  static SweepGradient get shopColor => const SweepGradient(
        colors: [
          Color(0xFFC0392B),
          Color(0xFFDF8F83),
          Color(0xFFFFE6DB),
          Color(0xFFDF8F83),
          Color(0xFFC0392B),
          Color(0XFFEFBBAF),
        ],
        stops: [
          0.11,
          0.28,
          0.38,
          0.57,
          0.77,
          0.89,
        ],
        transform: GradientRotation(3.14159),
      );

  static Color get mainColor => const Color(0xFFC0392B);

  static Color get firstWhite => const Color(0xFFF2F2F2);
  static Color get secondWhite => const Color(0xFFF8F8F8);

  static Color get firstBlack => const Color(0x00000000);
  static Color get secondBlack => const Color(0xFF1A1A1A);
}
