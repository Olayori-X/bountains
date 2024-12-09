import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_seller_dashboard_model.dart';
import 'package:bountains/features/seller/dashboard/presentation/functions/home.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/home_container_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getDashboardData(ref));
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(dashboardStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(dashboardErrorMessageProvider));
      } else if (next == AppState.success) {
        print('yeah');
      }
    });

    SellerDashboardResponse? homeData = ref.watch(homeDataProvider);

    return RefreshIndicator(
      onRefresh: () async {
        await Future(() => getDashboardData(ref));
      },
      edgeOffset: 3.h,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 14.h,
            horizontal: 13.w,
          ),
          child: Skeletonizer(
            enabled: ref.watch(dashboardStateProvider) == AppState.loading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 9.h),
                homeContainer(
                  data: "₦${homeData?.accountBalance}",
                  height: 128.h,
                  style: AppTextStyles.h3Bold.copyWith(
                    fontFamily: "Poppins",
                    color: AppColors.firstWhite,
                  ),
                ),
                SizedBox(height: 29.h),
                homeContainer(
                  data: "${homeData?.orders}",
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
                      data: "${homeData?.completedorders}",
                      height: 130.h,
                      label: "Completed",
                      width: 180.w,
                      style: AppTextStyles.h2Bold.copyWith(
                        fontFamily: "Poppins",
                        color: AppColors.firstWhite,
                      ),
                    ),
                    homeContainer(
                      data: "${homeData?.pendingorders}",
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
                  data: "${homeData?.sales}",
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
        ),
      ),
    );
  }
}
