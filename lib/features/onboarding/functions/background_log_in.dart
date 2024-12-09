// import 'package:bountains/core/provider/global.dart';
// import 'package:bountains/features/buyer/dashboard/presentation/functions/shop.dart';
// import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
// import 'package:bountains/features/seller/dashboard/presentation/functions/home.dart';
// import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// bool executeSellerDashboard(WidgetRef ref) {
//   bool isSuccess = false;
//   getDashboardData(ref);

//   ref.listen(dashboardStateProvider, (previous, next) {
//     if (next == AppState.error) {
//       isSuccess = false;
//     } else if (next == AppState.success) {
//       isSuccess = true;
//     }
//   });

//   return isSuccess;
// }

// bool executeBuyerDashboard(
//   WidgetRef ref,
// ) {
//   bool isSuccess = false;
//   getMealsForShopData(ref);

//   ref.listen(mealForShopsStateProvider, (previous, next) {
//     if (next == AppState.error) {
//       isSuccess = false;
//     } else if (next == AppState.success) {
//       isSuccess = true;
//     }
//   });

//   return isSuccess;
// }

import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/buyer/dashboard/domain/usecases/get_food_for_shop_use_case.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/shop_provider.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/meals_providers.dart';
import 'package:bountains/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

bool isSuccess = false;
Future<void> getMealsForShopData(WidgetRef ref) async {
  ref.watch(mealStateProvider.notifier).state = AppState.loading;
  MealsForShopUseCaseParams params = MealsForShopUseCaseParams(
    buyerid: serviceLocator<UserCredentials>().sellerid,
  );
  await _getMealsForShopData(ref, params);
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
      ref.watch(mealForShopsErrorMessageProvider.notifier).state = r.message;
      ref.watch(mealForShopsStateProvider.notifier).state = AppState.error;
    },
  );
}
