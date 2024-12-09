import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/get_orders_use_case.dart';
import 'package:bountains/features/seller/dashboard/presentation/providers/orders_providers.dart';
import 'package:bountains/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void getOrderData(WidgetRef ref) {
  ref.watch(ordersStateProvider.notifier).state = AppState.loading;
  String sellerid = serviceLocator<UserCredentials>().sellerid;
  _getOrderData(ref, sellerid);
}

Future<void> _getOrderData(
  WidgetRef ref,
  String param,
) async {
  GetOrdersUseCase useCase = GetIt.I.get();
  final response = await useCase(param);
  response.fold(
    (l) {
      ref.watch(orderProvider.notifier).state = l.orders;
      ref.watch(ordersStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(orderErrorMessageProvider.notifier).state = r.message;
      ref.watch(ordersStateProvider.notifier).state = AppState.error;
    },
  );
}
