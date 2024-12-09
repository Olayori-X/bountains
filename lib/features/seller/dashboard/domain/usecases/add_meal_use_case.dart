import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/add_meal_repository.dart';
import 'package:fpdart/fpdart.dart';

class AddMealUseCase implements UseCase<bool, AddMealParams> {
  final AddMealRepository repository;

  const AddMealUseCase({
    required this.repository,
  });

  @override
  Future<Either<bool, BountainsError>> call(AddMealParams params) async {
    return await repository.create(params);
  }
}

class AddMealParams {
  final String sellerid;
  final String category;
  final String meal;
  final String price;
  final String description;
  final String quantityUnit;
  final String picture;

  AddMealParams({
    required this.sellerid,
    required this.category,
    required this.meal,
    required this.price,
    required this.description,
    required this.quantityUnit,
    required this.picture,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerid": sellerid,
      "description": description,
      "category": category,
      "meal": meal,
      "price": price,
      "quantityUnit": quantityUnit,
      "picture": picture,
    };
  }
}
