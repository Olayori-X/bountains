import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/buyer/dashboard/domain/usecases/get_food_for_shop_use_case.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/meals_providers.dart';
import 'package:bountains/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

bool isSuccess = false;
void getMealsForShopData(WidgetRef ref) {
  ref.watch(mealStateProvider.notifier).state = AppState.loading;
  MealsForShopUseCaseParams params = MealsForShopUseCaseParams(
    buyerid: serviceLocator<UserCredentials>().sellerid,
  );
  _getMealsForShopData(ref, params);
}

Future<void> _getMealsForShopData(
  WidgetRef ref,
  MealsForShopUseCaseParams params,
) async {
  MealsForShopUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(mealForShopsProvider.notifier).state = l;
      print(l.toJson());
      isSuccess = true;
      ref.watch(mealForShopsStateProvider.notifier).state = AppState.success;
    },
    (r) {
      isSuccess = false;
      print(r.message);
      ref.watch(mealForShopsErrorMessageProvider.notifier).state = r.message;
      ref.watch(mealForShopsStateProvider.notifier).state = AppState.error;
    },
  );
}
