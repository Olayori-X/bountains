import 'package:bountains/core/functions/error.dart';
import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/buyer/dashboard/presentation/functions/shop.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:skeletonizer/skeletonizer.dart';

class FoodLayout extends ConsumerStatefulWidget {
  const FoodLayout({super.key});

  @override
  ConsumerState<FoodLayout> createState() => _FoodLayoutState();
}

class _FoodLayoutState extends ConsumerState<FoodLayout> {
  final CardSwiperController controller = CardSwiperController();

  void onMealStateChanged() {
    ref.listen(mealForShopsStateProvider, (previous, next) {
      if (next == AppState.error) {
        showSnackBarWithMessage(
            context, ref.watch(mealForShopsErrorMessageProvider));
      }
    });
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }

  void addMeal(Meal newMeal) {
    if (ref.watch(mealsProvider).any((meal) => meal.mealid == newMeal.mealid)) {
      return;
    }

    ref.watch(mealsProvider.notifier).update((state) => [...state, newMeal]);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    onMealStateChanged();
    bool loading = mealForShopsStateProvider == AppState.loading;

    final List<Meal> meals =
        loading ? [] : ref.watch(mealForShopsProvider)?.meal ?? [];

    bool onSwipe(
      int previousIndex,
      int? currentIndex,
      CardSwiperDirection direction,
    ) {
      if (direction.name == "right") {
        addMeal(meals[previousIndex]);
      }
      return true;
    }

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
                child: CardSwiper(
                  controller: controller,
                  cardsCount: meals.length,
                  cardBuilder:
                      (context, index, percentThresholdX, percentThresholdY) {
                    return FoodContainer(meal: meals[index]);
                  },
                  numberOfCardsDisplayed: 2,
                  scale: 0.5,
                  isLoop: true,
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                  duration: const Duration(milliseconds: 300),
                  onSwipe: onSwipe,
                  onUndo: _onUndo,
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
