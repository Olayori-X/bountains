import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_meal_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_meal_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetMealsUseCase
    implements UseCase<GetMealsResponse, GetMealsUseCaseParams> {
  final GetMealsRepository repository;

  const GetMealsUseCase({
    required this.repository,
  });

  @override
  Future<Either<GetMealsResponse, BountainsError>> call(
      GetMealsUseCaseParams params) async {
    return await repository.getMeals(GetMealsParams.fromJson(params.toJson()));
  }
}

class GetMealsUseCaseParams {
  final String sellerid;

  const GetMealsUseCaseParams({
    required this.sellerid,
  });

  Map<String, String> toJson() {
    return {
      "sellerid": sellerid,
    };
  }
}
