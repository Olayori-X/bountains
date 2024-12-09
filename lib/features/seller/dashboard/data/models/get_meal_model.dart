import 'package:bountains/features/seller/dashboard/domain/entities/meal.dart';

class GetMealsPayload {
  final String sellerid;

  const GetMealsPayload({
    required this.sellerid,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerid": sellerid,
    };
  }

  factory GetMealsPayload.fromJson(Map<String, dynamic> map) {
    return GetMealsPayload(
      sellerid: map["sellerid"] ?? "",
    );
  }
}

class GetMealsResponse {
  final List<Meal> meal;
  final List<dynamic> categories;

  const GetMealsResponse({
    required this.meal,
    required this.categories,
  });

  Map<String, dynamic> toJson() {
    return {
      "meal": meal.map((m) => m.toJson()).toList(),
      "categories": categories,
    };
  }

  factory GetMealsResponse.fromJson(Map<String, dynamic> map) {
    return GetMealsResponse(
      meal: (map["meal"] as List<dynamic>)
          .map((item) => Meal.fromJson(item))
          .toList(),
      categories: List<String>.from(map["categories"] ?? []),
    );
  }
}
