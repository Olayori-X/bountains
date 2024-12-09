import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/presentation/functions/home.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

PreferredSizeWidget dashboardAppBar({
  required String name,
  required bool available,
  required WidgetRef ref,
}) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Text(
      'Hi, $name',
      style: AppTextStyles.title1Medium.copyWith(
        color: Colors.black,
      ),
    ),
    leading: null,
    automaticallyImplyLeading: false,
    actions: [
      ElevatedButton(
        onPressed: () {
          Future.delayed(Duration.zero, () {
            ref.read(availabilityProvider.notifier).state =
                !ref.read(availabilityProvider);
            setAvailabilityStatus(ref);
          });
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
              color: available ? Colors.green : Colors.redAccent[700],
            ),
            Text(
              available ? 'Check out' : "Check in",
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
