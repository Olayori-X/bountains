import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/dashboard/presentation/functions/shop.dart';
import 'package:bountains/features/buyer/dashboard/presentation/widgets/food_layout.dart';
import 'package:bountains/features/buyer/dashboard/presentation/widgets/restaurant_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodShop extends ConsumerStatefulWidget {
  const FoodShop({super.key});

  @override
  ConsumerState<FoodShop> createState() => _FoodShopState();
}

class _FoodShopState extends ConsumerState<FoodShop>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<Widget> children;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getMealsForShopData(ref));
    children = [
      const FoodLayout(),
      const RestaurantLayout(),
    ];
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 152.h),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: AppColors.shopColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: TabBarView(
              controller: controller,
              children: children,
            ),
          ),
          TabBar(
            controller: controller,
            dividerColor: Colors.transparent,
            indicatorColor: Color(0xFFFFE6DB),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4.h,
            labelStyle: AppTextStyles.title1SemiBold,
            labelColor: Color(0xFFFFE6DB),
            unselectedLabelStyle: AppTextStyles.title1,
            unselectedLabelColor: Color(0xFFFFE6DB),
            tabs: const [
              Tab(text: 'Food'),
              Tab(text: 'Vendor'),
            ],
          ),
          SizedBox(height: 80.h),
        ],
      ),
    );
  }
}
