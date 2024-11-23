import 'package:bountains/core/provider/global.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<double> completeProfileProgressProvider =
    StateProvider((ref) => 0.5);

final StateProvider<AppState> completeProfileStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> completeProfileErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<bool> completeProfileResponseProvider =
    StateProvider((ref) => false);

final StateProvider<String> vendorNameProvider = StateProvider((ref) => '');
final StateProvider<String> descriptionProvider = StateProvider((ref) => '');

final StateProvider<String> accountNameProvider = StateProvider((ref) => '');
final StateProvider<String> accountNumberProvider = StateProvider((ref) => '');

final StateProvider<String?> bankNameProvider = StateProvider((ref) => '');

final StateProvider<String?> bankCodeProvider = StateProvider((ref) => '');

final StateProvider<String?> vendorImageFilePathProvider =
    StateProvider((ref) => null);
