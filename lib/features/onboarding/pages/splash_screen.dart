import 'package:bountains/core/extensions/build_context.dart';
import 'package:bountains/core/file/file_handler.dart';
import 'package:bountains/core/navigation/pages.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

    Future.delayed(Duration(milliseconds: 500), () {
      controller.forward().then((_) async {
        String? authDetails = await FileHandler.loadAuthEmail();
        context.router.pushReplacementNamed(
          authDetails != null ? Pages.sellerlogin : Pages.onboarding,
          extra: authDetails,
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
