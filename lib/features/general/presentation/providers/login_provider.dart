import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailProvider = StateProvider<String>((ref) => '');

final passwordProvider = StateProvider<String>((ref) => '');

final StateProvider<AppState> loginStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> loginErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<User?> loginResponseProvider = StateProvider((ref) => null);
