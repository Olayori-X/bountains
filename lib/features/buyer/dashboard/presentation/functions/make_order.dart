import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/buyer/dashboard/domain/usecases/make_order_use_case.dart';
import 'package:bountains/features/buyer/dashboard/presentation/providers/order_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void makeOrder(WidgetRef ref, MakeOrderUseCaseParams params) {
  ref.watch(makeOrderStateProvider.notifier).state = AppState.loading;
  _makeOrder(ref, params);
}

Future<void> _makeOrder(
  WidgetRef ref,
  MakeOrderUseCaseParams params,
) async {
  MakeOrderUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(makeOrderStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(makeOrderErrorMessageProvider.notifier).state = r.message;
      ref.watch(makeOrderStateProvider.notifier).state = AppState.error;
    },
  );
}
