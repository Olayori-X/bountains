import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/add_meal_use_case.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_category_and_quantityunit_usecase.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/add_meal_provider.dart';
import 'package:bountains/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void getCategoryAndQuantityUnitData(WidgetRef ref) {
  ref.watch(categoryAndQuantityUnitStateProvider.notifier).state =
      AppState.loading;
  CategoryAndQuantityUnitUseCaseParams params =
      CategoryAndQuantityUnitUseCaseParams(
    userid: serviceLocator<UserCredentials>().sellerid,
  );
  _getCategoryAndQuantityUnitData(ref, params);
}

Future<void> _getCategoryAndQuantityUnitData(
  WidgetRef ref,
  CategoryAndQuantityUnitUseCaseParams params,
) async {
  CategoryAndQuantityUnitUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(categoryAndQuantityUnitStateProvider.notifier).state =
          AppState.success;
      ref.watch(categoryAndQuantityUnitProvider.notifier).state = l;
    },
    (r) {
      ref.watch(categoryAndQuantityUnitErrorMessageProvider.notifier).state =
          r.message;
      ref.watch(categoryAndQuantityUnitStateProvider.notifier).state =
          AppState.error;
    },
  );
}

void addMeal(WidgetRef ref, AddMealParams params) {
  ref.watch(addMealStateProvider.notifier).state = AppState.loading;
  _addMeal(ref, params);
}

Future<void> _addMeal(
  WidgetRef ref,
  AddMealParams params,
) async {
  AddMealUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(addMealStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(addMealErrorMessageProvider.notifier).state = r.message;
      ref.watch(addMealStateProvider.notifier).state = AppState.error;
    },
  );
}
