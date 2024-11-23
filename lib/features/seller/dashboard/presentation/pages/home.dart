import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/home_container_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 14.h,
        horizontal: 13.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 9.h),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                homeContainer(
                  data: "₦150,000",
                  height: 128.h,
                  style: AppTextStyles.h3Bold.copyWith(
                    fontFamily: "Poppins",
                    color: AppColors.firstWhite,
                  ),
                ),
                SizedBox(height: 29.h),
                homeContainer(
                  data: "1000",
                  height: 109.h,
                  label: "Total Order",
                  style: AppTextStyles.h3Bold.copyWith(
                    fontFamily: "Poppins",
                    color: AppColors.firstWhite,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homeContainer(
                      data: "1000",
                      height: 130.h,
                      label: "Completed",
                      width: 180.w,
                      style: AppTextStyles.h2Bold.copyWith(
                        fontFamily: "Poppins",
                        color: AppColors.firstWhite,
                      ),
                    ),
                    homeContainer(
                      data: "1000",
                      height: 130.h,
                      label: "Pending",
                      width: 180.w,
                      style: AppTextStyles.h2Bold.copyWith(
                        fontFamily: "Poppins",
                        color: AppColors.firstWhite,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 29.h),
                homeContainer(
                  data: "5000000",
                  height: 109.h,
                  label: "Total Sales",
                  style: AppTextStyles.h3Bold.copyWith(
                    fontFamily: "Poppins",
                    color: AppColors.firstWhite,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
