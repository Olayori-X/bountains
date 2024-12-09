import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/add_meal_use_case.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AddMealRepository {
  Future<Either<bool, BountainsError>> create(AddMealParams params);
}
