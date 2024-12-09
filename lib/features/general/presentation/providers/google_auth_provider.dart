import 'package:bountains/core/provider/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<AppState> googleAuthStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> googleAuthErrorMessageProvider =
    StateProvider((ref) => "");
