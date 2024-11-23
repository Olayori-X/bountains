import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:bountains/features/seller/auth/domain/usecases/manual_register_use_case.dart';
import 'package:bountains/features/seller/auth/presentation/provider/signup_provider.dart';

void manualRegister(WidgetRef ref, ManualRegisterParams params) {
  ref.watch(registerStateProvider.notifier).state = AppState.loading;
  _initiateManualRegisterProcess(ref, params);
}

Future<void> _initiateManualRegisterProcess(
  WidgetRef ref,
  ManualRegisterParams params,
) async {
  ManualRegisterUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  // print(jsonEncode(response));
  response.fold(
    (l) {
      ref.watch(registerResponseProvider.notifier).state = l;
      ref.watch(registerStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(registerErrorMessageProvider.notifier).state = r.message;
      ref.watch(registerStateProvider.notifier).state = AppState.error;
    },
  );
}

// Future<void> initiateGoogleAuthProcess(WidgetRef ref) async {
//   GoogleAuthUseCase googleAuthUseCase = GetIt.I.get();
//   final googleAuthResponse = await googleAuthUseCase(const NoParams());

//   googleAuthResponse.fold((l) async {
//     await _initiateGoogleRegisterProcess(ref, l);
//   }, (r) {
//     print("Here in google auth provider: ${r.message}");
//     ref.watch(registerErrorMessageProvider.notifier).state = r.message;
//     ref.watch(registerStateProvider.notifier).state = AppState.error;
//   });
// }

// Future<void> _initiateGoogleRegisterProcess(
//   WidgetRef ref,
//   GoogleRegisterParams params,
// ) async {
//   GoogleRegisterUseCase googleRegisterUseCase = GetIt.I.get();
//   final googleRegisterResponse = await googleRegisterUseCase(params);
//   googleRegisterResponse.fold((l) {
//     ref.watch(registerResponseProvider.notifier).state = l;
//     ref.watch(registerStateProvider.notifier).state = AppState.success;
//   }, (r) {
//     ref.watch(registerErrorMessageProvider.notifier).state = r.message;
//     ref.watch(registerStateProvider.notifier).state = AppState.error;
//   });
// }
