import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_seller_dashboard_usecase.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

bool sellersuccess = false;
Future<void> getDashboardData(WidgetRef ref) async {
  ref.watch(dashboardStateProvider.notifier).state = AppState.loading;
  SellerDashboardUseCaseParams params = SellerDashboardUseCaseParams(
    userid: serviceLocator<UserCredentials>().sellerid,
  );
  await _getDashboardData(ref, params);
}

Future<void> _getDashboardData(
  WidgetRef ref,
  SellerDashboardUseCaseParams params,
) async {
  SellerDashboardUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(homeDataProvider.notifier).state = l;
      sellersuccess = true;
      ref.watch(dashboardStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(dashboardErrorMessageProvider.notifier).state = r.message;
      sellersuccess = false;
      ref.watch(dashboardStateProvider.notifier).state = AppState.error;
    },
  );
}
