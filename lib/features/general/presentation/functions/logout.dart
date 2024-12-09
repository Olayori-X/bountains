import 'package:bountains/core/file/file_handler.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/general/domain/usecases/log_out_use_case.dart';
import 'package:bountains/features/general/presentation/providers/login_provider.dart';
import 'package:bountains/features/general/presentation/providers/logout_provider.dart';
import 'package:bountains/features/utility/functions/logout.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

Future<void> logout(WidgetRef ref) async {
  ref.watch(loginStateProvider.notifier).state = AppState.loading;
  NoParams params = const NoParams();
  await _logout(ref, params);
}

Future<void> _logout(
  WidgetRef ref,
  NoParams params,
) async {
  LogOutUseCase useCase = GetIt.I.get();
  final response = await useCase(params);
  response.fold(
    (l) {
      FileHandler.saveAuthDetailsDashboard({
        'accessToken': "authenticationAccessTokenKey",
        'userId': "authenticationUserIdKey",
        'role': "authenticationRoleKey",
      });
      ref.watch(loginStateProvider.notifier).state = AppState.initial;
      logoutInvalidate(ref);
      ref.watch(logOutStateProvider.notifier).state = AppState.success;
    },
    (r) {
      ref.watch(logOutErrorMessageProvider.notifier).state = r.message;
      ref.watch(logOutStateProvider.notifier).state = AppState.error;
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
