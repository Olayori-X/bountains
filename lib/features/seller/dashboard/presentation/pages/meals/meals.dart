import 'package:bountains/core/ui/ui.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:bountains/features/seller/dashboard/presentation/pages/meals/addmeal.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/meals_providers.dart';
import 'package:bountains/features/seller/dashboard/presentation/widgets/meal_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MealPage extends ConsumerStatefulWidget {
  const MealPage({super.key});

  @override
  ConsumerState<MealPage> createState() => _MealPageState();
}

class _MealPageState extends ConsumerState<MealPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  String selectedCategory = 'All';
  List<String> updatedcategories = [];

  @override
  void initState() {
    super.initState();
    updatedcategories = ['All', ...categories];

    // Initialize TabController with the correct length
    controller = TabController(length: updatedcategories.length, vsync: this);

    // Listen to tab changes
    controller.addListener(() {
      setState(() {
        selectedCategory = updatedcategories[controller.index];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> allMeals = ref.watch(mealsProvider);

    // Filter meals based on the selected category
    final List<Meal> filteredMeals = selectedCategory == 'All'
        ? allMeals
        : allMeals.where((meal) => meal.category == selectedCategory).toList();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddMeal()),
          );
        },
        backgroundColor: AppColors.mainColor,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: SafeArea(
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
                tabs:
                    updatedcategories.map((title) => Tab(text: title)).toList(),
              ),
              SizedBox(height: 24.h),
              Expanded(
                child: MealList(meals: filteredMeals),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
