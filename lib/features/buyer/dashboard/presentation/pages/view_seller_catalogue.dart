import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/buyer/dashboard/domain/entities/vendors.dart';
import 'package:bountains/features/buyer/dashboard/presentation/functions/view_seller_catlogue.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/meals_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/meal_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ViewCataloguePage extends ConsumerStatefulWidget {
  final Vendors seller;
  const ViewCataloguePage({super.key, required this.seller});

  @override
  ConsumerState<ViewCataloguePage> createState() => _ViewCataloguePageState();
}

class _ViewCataloguePageState extends ConsumerState<ViewCataloguePage>
    with TickerProviderStateMixin {
  TabController? controller;
  String selectedCategory = 'All';
  List<dynamic> updatedcategories = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero,
        () => viewSellerCatalogueData(ref, widget.seller.sellerid));
  }

  void onMealStateChanged() {
    ref.listen(mealStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(context, ref.watch(mealErrorMessageProvider));
      } else if (next == AppState.success) {
        List<dynamic> categories = ref.watch(mealProvider)?.categories ?? [];
        updatedcategories = ['All', ...categories];

        setState(() {
          controller =
              TabController(length: updatedcategories.length, vsync: this);
        });
        controller!.addListener(() {
          setState(() {
            selectedCategory = updatedcategories[controller!.index];
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    onMealStateChanged();
    bool loading = ref.watch(mealStateProvider) == AppState.loading;

    if (loading || (controller == null)) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    print(controller == null);

    final List<Meal>? allMeals = ref.watch(mealProvider)?.meal;

    // Filter meals based on the selected category
    final List<Meal>? filteredMeals = selectedCategory == 'All'
        ? allMeals
        : allMeals?.where((meal) => meal.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.seller.vendorName!)),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future(
            () => viewSellerCatalogueData(ref, widget.seller.sellerid),
          );
        },
        edgeOffset: 3.h,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 6.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabBar(
                  controller: controller,
                  isScrollable: true,
                  indicatorColor: AppColors.mainColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 5.h,
                  labelStyle: AppTextStyles.title1SemiBold,
                  labelColor: AppColors.primary2Normal2,
                  unselectedLabelStyle: AppTextStyles.title1,
                  unselectedLabelColor: AppColors.primary2Normal2,
                  tabs: updatedcategories
                      .map((title) => Tab(text: title))
                      .toList(),
                ),
                SizedBox(height: 24.h),
                Expanded(
                  child: MealList(meals: filteredMeals),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
