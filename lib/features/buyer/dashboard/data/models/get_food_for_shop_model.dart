import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/buyer/dashboard/domain/entities/vendors.dart';
import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';
import 'package:get_it/get_it.dart';

class MealsForShopPayload {
  final String buyerid;

  const MealsForShopPayload({
    required this.buyerid,
  });

  Map<String, dynamic> toJson() {
    return {
      "buyerid": buyerid,
      "latitude": GetIt.I<UserLocation>().latitude,
      "longitude": GetIt.I<UserLocation>().longitude,
    };
  }

  factory MealsForShopPayload.fromJson(Map<String, dynamic> map) {
    return MealsForShopPayload(
      buyerid: map["buyerid"] ?? "",
    );
  }
}

class MealsForShopResponse {
  final List<Meal> meal;
  final List<Vendors> vendors;

  const MealsForShopResponse({
    required this.meal,
    required this.vendors,
  });

  Map<String, dynamic> toJson() {
    return {
      "meal": meal.map((m) => m.toJson()).toList(),
      "vendors": vendors.map((m) => m.toJson()).toList(),
    };
  }

  factory MealsForShopResponse.fromJson(Map<String, dynamic> map) {
    return MealsForShopResponse(
      meal: (map["meal"] as List<dynamic>)
          .map((item) => Meal.fromJson(item))
          .toList(),
      vendors: (map['vendors'] as List<dynamic>)
          .map((item) => Vendors.fromJson(item))
          .toList(),
    );
  }
}
