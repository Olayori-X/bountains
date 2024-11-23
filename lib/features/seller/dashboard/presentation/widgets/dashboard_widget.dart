import 'package:bountains/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget dashboardAppBar(
    {required String name, required bool available}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      'Hi, $name',
      style: AppTextStyles.title1Medium.copyWith(
        color: AppColors.firstBlack,
      ),
    ),
    actions: [
      ElevatedButton(
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const DashBoard()),
          // );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainColor,
          elevation: 0,
          minimumSize: Size(
            118.w,
            36.h,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 1),
        ),
        child: Row(
          children: [
            Icon(
              Icons.circle,
              size: 15.r,
              color: available ? Colors.redAccent[700] : Colors.green,
            ),
            Text(
              available ? 'Check in' : "Check out",
              style: AppTextStyles.littlebuttonText.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      SizedBox(width: 10.w), // Add space after the button if needed
    ],
  );
}
