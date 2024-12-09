import 'package:bountains/core/provider/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<AppState> makeOrderStateProvider =
    StateProvider((ref) => AppState.initial);

// final StateProvider<MealsForShopResponse?> mealForShopsProvider =
//     StateProvider((ref) => null);

final StateProvider<String> makeOrderErrorMessageProvider =
    StateProvider((ref) => "");
