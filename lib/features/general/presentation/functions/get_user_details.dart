import 'package:bountains/core/network/token.dart';
import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/general/domain/usecases/get_user_details_use_case.dart';
import 'package:bountains/features/general/presentation/providers/login_provider.dart';
import 'package:bountains/init.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

void getUserDetails(WidgetRef ref) {
  ref.watch(loginStateProvider.notifier).state = AppState.loading;
  String userid = serviceLocator<UserCredentials>().sellerid;
  _getUserDetails(ref, userid);
}

Future<void> _getUserDetails(
  WidgetRef ref,
  String param,
) async {
  GetUserDetailsUseCase useCase = GetIt.I.get();
  final response = await useCase(param);
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
