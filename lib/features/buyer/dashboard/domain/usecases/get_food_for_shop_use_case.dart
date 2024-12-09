import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/buyer/dashboard/data/models/get_food_for_shop_model.dart';
import 'package:bountains/features/buyer/dashboard/domain/repositories/get_food_for_shop_repository.dart';
import 'package:fpdart/fpdart.dart';

class MealsForShopUseCase
    implements UseCase<MealsForShopResponse, MealsForShopUseCaseParams> {
  final MealsForShopRepository repository;

  const MealsForShopUseCase({
    required this.repository,
  });

  @override
  Future<Either<MealsForShopResponse, BountainsError>> call(
      MealsForShopUseCaseParams params) async {
    return await repository
        .mealsForShop(MealsForShopParams.fromJson(params.toJson()));
  }
}

class MealsForShopUseCaseParams {
  final String buyerid;

  const MealsForShopUseCaseParams({
    required this.buyerid,
  });

  Map<String, String> toJson() {
    return {
      "buyerid": buyerid,
    };
  }
}
