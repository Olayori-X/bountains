import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/profile/domain/usecases/complete_vendor_profile_usecase.dart';
import 'package:bountains/features/seller/profile/presentation/provider/complete_profile_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void completeVendorProfile(WidgetRef ref, CompleteVendorProfileParams params) {
  ref.watch(completeProfileStateProvider.notifier).state = AppState.loading;
  _completeVendorProfile(ref, params);
}

Future<void> _completeVendorProfile(
  WidgetRef ref,
  CompleteVendorProfileParams params,
) async {
  CompleteVendorProfileUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(completeProfileStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(completeProfileErrorMessageProvider.notifier).state = r.message;
      ref.watch(completeProfileStateProvider.notifier).state = AppState.error;
    },
  );
}
