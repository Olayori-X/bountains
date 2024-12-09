import 'package:bountains/core/provider/global.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_seller_dashboard_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final StateProvider<int> pageIndexProvider = StateProvider((ref) => 0);

final StateProvider<SellerDashboardResponse?> homeDataProvider =
    StateProvider((ref) => null);

final StateProvider<AppState> dashboardStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> dashboardErrorMessageProvider =
    StateProvider((ref) => "");

final StateProvider<AppState> setAvailabilityStatusStateProvider =
    StateProvider((ref) => AppState.initial);

final StateProvider<String> setAvailabilityStatusErrorMessageProvider =
    StateProvider((ref) => "");

final availabilityProvider = StateProvider<bool>((ref) => false);
