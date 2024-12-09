import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/buyer/dashboard/data/datasources/get_food_for_shop_datasource.dart';
import 'package:bountains/features/buyer/dashboard/data/models/get_food_for_shop_model.dart';
import 'package:bountains/features/buyer/dashboard/domain/repositories/get_food_for_shop_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class MealsForShopRepositoryImpl implements MealsForShopRepository {
  final MealsForShopDataSource dataSource;

  MealsForShopRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<MealsForShopResponse, BountainsError>> mealsForShop(
      MealsForShopParams mealsForShopParams) async {
    MealsForShopPayload mealsForShopPayload =
        MealsForShopPayload.fromJson(mealsForShopParams.toJson());

    try {
      MealsForShopResponse mealData =
          await dataSource.getMealsForShopData(mealsForShopPayload);
      return Either.left(mealData);
    } on DioException catch (e) {
      return Either.right(
        determineDioError(e),
      );
    } catch (e) {
      return Either.right(
        BountainsError(
          message: "Error: $e",
        ),
      );
    }
  }
}
