import 'package:bountains/features/seller/auth/domain/usecases/verify_otp_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:bountains/features/seller/auth/presentation/provider/signup_provider.dart';

void verifyOTP(WidgetRef ref, VerifyParams params) {
  ref.watch(registerStateProvider.notifier).state = AppState.loading;
  _initiateVerifyOTPProcess(ref, params);
}

Future<void> _initiateVerifyOTPProcess(
  WidgetRef ref,
  VerifyParams params,
) async {
  VerifyOTPUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(otpResponseProvider.notifier).state = l;
      ref.watch(otpStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(otpErrorMessageProvider.notifier).state = r.message;
      ref.watch(otpStateProvider.notifier).state = AppState.error;
    },
  );
}
