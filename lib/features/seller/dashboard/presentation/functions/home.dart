import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_seller_dashboard_usecase.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/set_availability_status_use_case.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/dashboard_providers.dart';
import 'package:bountains/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void getDashboardData(WidgetRef ref) {
  ref.watch(dashboardStateProvider.notifier).state = AppState.loading;
  SellerDashboardUseCaseParams params = SellerDashboardUseCaseParams(
    userid: serviceLocator<UserCredentials>().sellerid,
  );
  _getDashboardData(ref, params);
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
      ref.watch(dashboardStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(dashboardErrorMessageProvider.notifier).state = r.message;
      ref.watch(dashboardStateProvider.notifier).state = AppState.error;
    },
  );
}

Future<void> setAvailabilityStatus(WidgetRef ref) async {
  // ref.watch(loginStateProvider.notifier).state = AppState.loading;
  NoParams params = const NoParams();
  await _setAvailabilityStatus(ref, params);
}

Future<void> _setAvailabilityStatus(
  WidgetRef ref,
  NoParams params,
) async {
  SetAvailabilityUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(setAvailabilityStatusStateProvider.notifier).state =
          AppState.success;
    },
    (r) {
      ref.watch(setAvailabilityStatusErrorMessageProvider.notifier).state =
          r.message;
      ref.watch(setAvailabilityStatusStateProvider.notifier).state =
          AppState.error;
    },
  );
}
