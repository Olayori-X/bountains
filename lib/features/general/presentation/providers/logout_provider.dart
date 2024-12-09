import 'package:bountains/core/provider/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<AppState> logOutStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> logOutErrorMessageProvider =
    StateProvider((ref) => "");
