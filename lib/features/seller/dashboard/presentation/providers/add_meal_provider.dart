import 'package:bountains/core/provider/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<AppState> completeProfileStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> completeProfileErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<bool> completeProfileResponseProvider =
    StateProvider((ref) => false);

final StateProvider<String> mealProvider = StateProvider((ref) => '');
final StateProvider<String> descriptionProvider = StateProvider((ref) => '');

final StateProvider<String?> selectedCategoryProvider =
    StateProvider((ref) => null);

final StateProvider<String> priceProvider = StateProvider((ref) => '');

final StateProvider<String?> quantityUntProvider = StateProvider((ref) => null);

final StateProvider<String?> mealImageFilePathProvider =
    StateProvider((ref) => null);
