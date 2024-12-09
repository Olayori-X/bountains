import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/presentation/functions/get_user_details.dart';
import 'package:bountains/features/general/presentation/providers/login_provider.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/home.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/meals/meals.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/orders.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/dashboard_widget.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class SellerDashboard extends ConsumerStatefulWidget {
  const SellerDashboard({super.key});

  @override
  ConsumerState<SellerDashboard> createState() => _SellerDashboardState();
}

class _SellerDashboardState extends ConsumerState<SellerDashboard> {
  late List<Widget> children;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    // Fetch user details once the widget is initialized
    Future.microtask(() => getUserDetails(ref));

    // Initialize children
    children = [
      Home(),
      const Orders(),
      const MealPage(),
      const Settings(),
    ];

    // Initialize availabilityProvider safely
    Future.microtask(() {
      final bool available = ref.read(homeDataProvider)?.available ?? false;
      ref.read(availabilityProvider.notifier).state = available;
    });
  }

  @override
  Widget build(BuildContext context) {
    int index = ref.watch(pageIndexProvider);
    final User? data = ref.watch(loginResponseProvider);

    return Scaffold(
      appBar: dashboardAppBar(
        name: data?.fullName ?? "",
        available: ref.watch(availabilityProvider),
        ref: ref,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            left: 18.w,
            right: 18.w,
            top: 15.h,
            bottom: 5.h,
          ),
          child: IndexedStack(
            index: index,
            children: children,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int newPage) =>
            ref.read(pageIndexProvider.notifier).state = newPage,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: AppTextStyles.body1Bold.copyWith(
          color: AppColors.mainColor,
        ),
        selectedItemColor: AppColors.mainColor,
        unselectedLabelStyle: AppTextStyles.body1Medium.copyWith(
          color: AppColors.primary,
        ),
        unselectedItemColor: AppColors.primary2Lighter,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBold.home_2,
              size: 26.r,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBold.note,
              size: 26.r,
            ),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBold.play,
              size: 26.r,
            ),
            label: "Meal",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBold.setting,
              size: 26.r,
            ),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
