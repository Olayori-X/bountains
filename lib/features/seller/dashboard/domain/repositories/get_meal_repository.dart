import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_meal_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GetMealsRepository {
  Future<Either<GetMealsResponse, BountainsError>> getMeals(
    GetMealsParams getMealsParameters,
  );
}

class GetMealsParams {
  final String sellerid;

  const GetMealsParams({
    required this.sellerid,
  });

  Map<String, String> toJson() {
    return {
      "sellerid": sellerid,
    };
  }

  factory GetMealsParams.fromJson(Map<String, String> map) {
    return GetMealsParams(
      sellerid: map["sellerid"]!,
    );
  }
}
