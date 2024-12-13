import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/file/file_handler.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/onboarding/functions/background_log_in.dart';
import 'package:bountains/features/onboarding/functions/background_login_sellers.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/features/utility/functions/get_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:is_first_run/is_first_run.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    Future.delayed(Duration(milliseconds: 1000), () {
      controller.forward().then((_) async {
        String destination;

        bool firstRun = await IsFirstRun.isFirstRun();
        if (!firstRun) {
          Map<String, String?>? authDetails =
              await FileHandler.loadAuthDetailsDashboard();

          if (authDetails?['accessToken'] != null &&
              authDetails?['accessToken'] != 'authenticationAccessTokenKey') {
            GetIt.I<AppTokens>().accessToken =
                authDetails!['accessToken'] ?? "";

            GetIt.I<UserCredentials>().sellerid = authDetails['userid'] ?? "";
            if (authDetails['role'] == "vendor") {
              await getCurrentLocation();
              await getDashboardData(ref);
              ref.watch(accountTypeProvider.notifier).state =
                  sellersuccess ? 'Vendor' : "";
              print(sellersuccess);
              print(ref.watch(dashboardErrorMessageProvider));
              destination =
                  sellersuccess ? Pages.sellerDashboard : Pages.sellerlogin;
            } else {
              await getCurrentLocation();
              await getMealsForShopData(ref);
              ref.watch(accountTypeProvider.notifier).state =
                  isSuccess ? 'Buyer' : "";
              destination =
                  isSuccess ? Pages.buyerDashboard : Pages.sellerlogin;
            }
          } else {
            authDetails = await FileHandler.loadAuthDetails();
            if (authDetails!['email'] != null) {}
            destination = Pages.sellerlogin;
          }
        } else {
          destination = Pages.onboarding;
        }
        context.router.pushReplacementNamed(
          destination,
        );
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppColors.backgroundColor, // Assign the variable here
        ), // Set background color to green
        child: FadeTransition(
          opacity: animation,
          child: Center(
            child: Image.asset(
              'assets/images/bountains-high-resolution-logo-white-transparent.png',
              // You can adjust the width and height of the image as needed
              width: 200.w,
              height: 200.h,
            ),
          ),
        ),
      ),
    );
  }
}
