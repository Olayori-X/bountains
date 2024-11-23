import 'package:bountains/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget homeContainer({
  required String data,
  String label = "",
  double height = 0,
  double? width = 0,
  TextStyle? style,
}) {
  return Container(
    alignment: Alignment.bottomLeft,
    padding: EdgeInsets.only(
      bottom: 17.h,
      left: 19.h,
    ),
    height: height,
    width: width,
    decoration: BoxDecoration(
      gradient: AppColors.backgroundColor,
      borderRadius: BorderRadius.circular(25.r),
    ),
    child: Align(
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != "")
            Text(
              label,
              style: style,
            ),
          Text(
            data,
            style: AppTextStyles.h3Bold.copyWith(
              fontFamily: "Poppins",
              color: AppColors.firstWhite,
            ),
          ),
        ],
      ),
    ),
  );
}
