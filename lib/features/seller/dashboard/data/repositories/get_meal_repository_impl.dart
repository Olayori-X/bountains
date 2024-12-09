import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_meal_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_meal_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_meal_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class GetMealsRepositoryImpl implements GetMealsRepository {
  final GetMealsDataSource dataSource;

  GetMealsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<GetMealsResponse, BountainsError>> getMeals(
      GetMealsParams getMealsParams) async {
    GetMealsPayload getMealsPayload =
        GetMealsPayload.fromJson(getMealsParams.toJson());

    try {
      GetMealsResponse mealData =
          await dataSource.getMealsData(getMealsPayload);
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
