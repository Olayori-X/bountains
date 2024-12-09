import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_category_and_quantityunit_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CategoryAndQuantityUnitRepository {
  Future<Either<CategoryAndQuantityUnitResponse, BountainsError>>
      getCategoryAndQuantityUnit(
    CategoryAndQuantityUnitParams categoryAndQuantityUnitParameters,
  );
}

class CategoryAndQuantityUnitParams {
  final String userid;

  const CategoryAndQuantityUnitParams({
    required this.userid,
  });

  Map<String, String> toJson() {
    return {
      "userid": userid,
    };
  }

  factory CategoryAndQuantityUnitParams.fromJson(Map<String, String> map) {
    return CategoryAndQuantityUnitParams(
      userid: map["userid"]!,
    );
  }
}
