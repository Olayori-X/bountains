import 'package:bountains/core/file/file_handler.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/general/domain/usecases/google_authentication_use_case.dart';
import 'package:bountains/features/general/domain/usecases/google_continuation_use_case.dart';
import 'package:bountains/features/general/presentation/providers/google_auth_provider.dart';
import 'package:bountains/features/general/presentation/providers/login_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

Future<void> initiateGoogleAuthProcess(WidgetRef ref) async {
  GoogleAuthUseCase googleAuthUseCase = GetIt.I.get();
  final googleAuthResponse = await googleAuthUseCase(const NoParams());

  googleAuthResponse.fold((l) async {
    GoogleContinuationParams googleContinuationParams =
        GoogleContinuationParams(
      idToken: l.id,
      email: l.email,
      displayName: l.displayName,
      role: ref.watch(accountTypeProvider).toLowerCase(),
    );
    FileHandler.saveAuthEmail(l.email);
    // FileHandler.saveBool(FileHandler.isGoogleAuthenticated, true);
    ref.watch(googleAuthStateProvider.notifier).state = AppState.loading;
    await _initiateGoogleRegisterProcess(ref, googleContinuationParams);
  }, (r) {
    ref.watch(googleAuthErrorMessageProvider.notifier).state = r.message;
    ref.watch(googleAuthStateProvider.notifier).state = AppState.error;
  });
}

Future<void> _initiateGoogleRegisterProcess(
  WidgetRef ref,
  GoogleContinuationParams params,
) async {
  GoogleContinuationUseCase googleUseCase = GetIt.I.get();
  final googleRegisterResponse = await googleUseCase(params);
  googleRegisterResponse.fold((l) {
    ref.watch(loginResponseProvider.notifier).state = l;
    FileHandler.saveAuthDetailsDashboard({
      'accessToken': GetIt.I<AppTokens>().accessToken,
      'userId': GetIt.I<UserCredentials>().sellerid,
      'role': l.role,
    });
    ref.watch(googleAuthStateProvider.notifier).state = AppState.success;
  }, (r) {
    ref.watch(googleAuthErrorMessageProvider.notifier).state = r.message;
    ref.watch(googleAuthStateProvider.notifier).state = AppState.error;
  });
}
