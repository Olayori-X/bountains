import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/auth/domain/usecases/manual_login_use_case.dart';
import 'package:bountains/features/seller/auth/presentation/provider/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void manualLogin(WidgetRef ref, ManualLoginParams params) {
  ref.watch(loginStateProvider.notifier).state = AppState.loading;
  _initiateLoginProcess(ref, params);
}

Future<void> _initiateLoginProcess(
  WidgetRef ref,
  ManualLoginParams params,
) async {
  ManualLoginUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      ref.watch(loginResponseProvider.notifier).state = l;
      ref.watch(loginStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(loginErrorMessageProvider.notifier).state = r.message;
      ref.watch(loginStateProvider.notifier).state = AppState.error;
    },
  );
}

// Future<void> initiateGoogleAuthProcess(WidgetRef ref) async {
//   GoogleAuthUseCase googleAuthUseCase = GetIt.I.get();
//   final googleAuthResponse = await googleAuthUseCase(const NoParams());
//   googleAuthResponse.fold((l) async {
//     await _initiateGoogleLoginProcess(ref, l);
//   }, (r) {
//     ref.watch(loginErrorMessageProvider.notifier).state = r.message;
//     ref.watch(loginStateProvider.notifier).state = AppState.error;
//   });
// }

// Future<void> _initiateGoogleLoginProcess(
//   WidgetRef ref,
//   GoogleLoginParams params,
// ) async {
//   GoogleLoginUseCase googleLoginCase = GetIt.I.get();
//   final googleLoginResponse = await googleLoginCase(params);
//   googleLoginResponse.fold((l) {
//     ref.watch(loginResponseProvider.notifier).state = l;
//     ref.watch(loginStateProvider.notifier).state = AppState.success;
//   }, (r) {
//     ref.watch(loginErrorMessageProvider.notifier).state = r.message;
//     ref.watch(loginStateProvider.notifier).state = AppState.error;
//   });
// }
