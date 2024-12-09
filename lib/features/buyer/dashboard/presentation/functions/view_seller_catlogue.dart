import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_meal_use_case.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/meals_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void viewSellerCatalogueData(WidgetRef ref, String sellerid) {
  ref.watch(mealStateProvider.notifier).state = AppState.loading;
  GetMealsUseCaseParams params = GetMealsUseCaseParams(
    sellerid: sellerid,
  );
  _getMealData(ref, params);
}

Future<void> _getMealData(
  WidgetRef ref,
  GetMealsUseCaseParams params,
) async {
  GetMealsUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(mealProvider.notifier).state = l;
      ref.watch(mealStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(mealErrorMessageProvider.notifier).state = r.message;
      ref.watch(mealStateProvider.notifier).state = AppState.error;
    },
  );
}
