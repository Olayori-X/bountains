import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/buyer/dashboard/data/models/get_food_for_shop_model.dart';
import 'package:bountains/features/buyer/dashboard/presentation/functions/shop.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FoodLayout extends ConsumerStatefulWidget {
  const FoodLayout({super.key});

  @override
  ConsumerState<FoodLayout> createState() => _FoodLayoutState();
}

class _FoodLayoutState extends ConsumerState<FoodLayout> {
  void onMealStateChanged() {
    ref.listen(mealForShopsStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(mealForShopsErrorMessageProvider));
      }
    });
  }

  void addMeal(Meal newMeal) {
    if (ref.watch(mealsProvider).any((meal) => meal.mealid == newMeal.mealid)) {
      return;
    }

    ref.watch(mealsProvider.notifier).update((state) => [...state, newMeal]);
  }

  void removeMeal(Meal mealToRemove) {
    final List<Meal>? allMeals = ref.watch(mealForShopsProvider)?.meal;

    allMeals?.remove(mealToRemove);
    final MealsForShopResponse updatedResponse = MealsForShopResponse(
      meal: allMeals ?? [],
      vendors: ref.watch(mealForShopsProvider)!.vendors,
    );

    ref.watch(mealForShopsProvider.notifier).state = updatedResponse;
  }

  @override
  Widget build(BuildContext context) {
    onMealStateChanged();
    bool loading = ref.watch(mealForShopsStateProvider) == AppState.loading;

    List<Meal> meals =
        loading ? [] : ref.watch(filteredMealForShopsProvider)?.meal ?? [];

    return RefreshIndicator(
      onRefresh: () async {
        await Future(() => getMealsForShopData(ref));
      },
      edgeOffset: 3.h,
      child: meals.isEmpty
          ? const Center(
              child: Text("No meals available"),
            )
          : Skeletonizer(
              enabled: loading,
              child: Center(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: meals.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: Key(meals[index].mealid),
                      onDismissed: (direction) {
                        addMeal(meals[index]);
                        removeMeal(meals[index]);
                      },
                      direction: DismissDirection.up,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: FoodContainer(meal: meals[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
    );
  }
}

class FoodContainer extends StatelessWidget {
  final Meal meal;
  const FoodContainer({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350.w,
        height: 425.h,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFFFE6DB),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 350.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      meal.picture != null && meal.picture!.startsWith('http')
                          ? CachedNetworkImageProvider(meal.picture!)
                          : AssetImage('assets/images/jollof.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(meal.meal),
            Text(meal.description),
          ],
        ),
      ),
    );
  }
}
