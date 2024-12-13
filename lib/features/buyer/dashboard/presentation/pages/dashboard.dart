import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/dashboard/data/models/get_food_for_shop_model.dart';
import 'package:bountains/features/buyer/dashboard/domain/entities/vendors.dart';
import 'package:bountains/features/buyer/dashboard/presentation/pages/cart.dart';
import 'package:bountains/features/buyer/dashboard/presentation/pages/settings.dart';
import 'package:bountains/features/buyer/dashboard/presentation/pages/shop.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:bountains/features/general/presentation/functions/get_user_details.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class BuyerDashboard extends ConsumerStatefulWidget {
  const BuyerDashboard({super.key});

  @override
  ConsumerState<BuyerDashboard> createState() => _BuyerDashboardState();
}

class _BuyerDashboardState extends ConsumerState<BuyerDashboard> {
  late List<Widget> children;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  String searchFieldText = 'All';

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () => getUserDetails(ref));
    children = [
      FoodShop(),
      const Cart(),
      const Settings(),
    ];
  }

  final List<String> appBarText = ['Cart', 'Settings'];
  void onChanged(String value) {
    final MealsForShopResponse? mealsForShopResponse =
        ref.watch(mealForShopsProvider);

    final List<Meal>? allMeals = mealsForShopResponse?.meal;
    final List<Vendors>? allVendors = mealsForShopResponse?.vendors;

    if (value.trim().isEmpty) {
      ref.watch(mealForShopsProvider.notifier).state = mealsForShopResponse;
      return;
    }

    // Filter meals based on multiple properties
    final List<Meal>? filteredMeals = allMeals?.where((meal) {
      return (meal.category.toLowerCase().contains(value.toLowerCase())) ||
          (meal.meal.toLowerCase().contains(value.toLowerCase())) ||
          (meal.description.toLowerCase().contains(value.toLowerCase())) ||
          (meal.price.toString().contains(value));
    }).toList();

    final List<Vendors>? filteredVendors = allVendors?.where((vendor) {
      return (vendor.vendorName?.toLowerCase().contains(value.toLowerCase()) ??
              false) ||
          (vendor.state.toLowerCase().contains(value.toLowerCase())) ||
          (vendor.address.toLowerCase().contains(value.toLowerCase())) ||
          (vendor.city.toLowerCase().contains(value.toLowerCase())) ||
          (vendor.street.toLowerCase().contains(value.toLowerCase()));
    }).toList();

    final MealsForShopResponse updatedResponse = MealsForShopResponse(
      meal: filteredMeals ?? [],
      vendors: filteredVendors ?? [],
    );

    ref.watch(filteredMealForShopsProvider.notifier).state = updatedResponse;
  }

  @override
  Widget build(BuildContext context) {
    int index = ref.watch(pageIndexProvider);

    if (index < 0 || index >= children.length) {
      index = 0;
    }

    return Scaffold(
      extendBody: index == 0,
      extendBodyBehindAppBar: index == 0,
      appBar: AppBar(
        backgroundColor: index == 0 ? Colors.transparent : null,
        automaticallyImplyLeading: index != 0,
        title: index == 0
            ? Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 35.0,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE6DB),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Center(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    onChanged: (value) => onChanged(value),
                  ),
                ),
              )
            : (index - 1 >= 0 && index - 1 < appBarText.length
                ? Text(
                    appBarText[index - 1],
                    style: AppTextStyles.littlebuttonText.copyWith(
                      color: Colors.black,
                    ),
                  )
                : Text(
                    'Unknown Page', // Fallback title
                    style: AppTextStyles.littlebuttonText.copyWith(
                      color: Colors.black,
                    ),
                  )),
        centerTitle: true,
      ),
      body: IndexedStack(
        index: index,
        children: children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (int newPage) {
          // Constrain newPage within valid range
          if (newPage >= 0 && newPage < children.length) {
            ref.watch(pageIndexProvider.notifier).state = newPage;
          }
        },
        backgroundColor: index == 0 ? Colors.transparent : null,
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
              IconsaxPlusBold.shop,
              size: 26.r,
            ),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              IconsaxPlusBold.note,
              size: 26.r,
            ),
            label: "Cart",
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
