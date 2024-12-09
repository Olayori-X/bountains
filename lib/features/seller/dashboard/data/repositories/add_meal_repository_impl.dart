import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/add_meal_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/models/add_meal_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/add_meal_repository.dart';
import 'package:bountains/features/seller/dashboard/domain/usecases/add_meal_use_case.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class AddMealRepositoryImpl implements AddMealRepository {
  final AddMealDataSource dataSource;

  AddMealRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<bool, BountainsError>> create(AddMealParams params) async {
    AddMealPayload creationPayload = AddMealPayload.fromJson(params.toJson());

    try {
      bool response = await dataSource.create(creationPayload);
      return Either.left(response);
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
