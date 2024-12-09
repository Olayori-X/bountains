import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/buyer/dashboard/data/models/get_food_for_shop_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MealsForShopRepository {
  Future<Either<MealsForShopResponse, BountainsError>> mealsForShop(
    MealsForShopParams mealsForShopParameters,
  );
}

class MealsForShopParams {
  final String buyerid;

  const MealsForShopParams({
    required this.buyerid,
  });

  Map<String, String> toJson() {
    return {
      "buyerid": buyerid,
    };
  }

  factory MealsForShopParams.fromJson(Map<String, String> map) {
    return MealsForShopParams(
      buyerid: map["buyerid"]!,
    );
  }
}
