import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_category_and_quantityunit_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<AppState> addMealStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> addMealErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<bool> addMealResponseProvider =
    StateProvider((ref) => false);

final StateProvider<CategoryAndQuantityUnitResponse?>
    categoryAndQuantityUnitProvider = StateProvider((ref) => null);

final StateProvider<AppState> categoryAndQuantityUnitStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> categoryAndQuantityUnitErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<String> mealProvider = StateProvider((ref) => '');
final StateProvider<String> descriptionProvider = StateProvider((ref) => '');

final StateProvider<String> selectedCategoryProvider =
    StateProvider((ref) => "");

final StateProvider<String> priceProvider = StateProvider((ref) => '');

final StateProvider<String> quantityUnitProvider = StateProvider((ref) => "");

final StateProvider<String?> mealImageFilePathProvider =
    StateProvider((ref) => "");
