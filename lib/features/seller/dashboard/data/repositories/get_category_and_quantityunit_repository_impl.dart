import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_category_and_quantityunit_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_category_and_quantityunit_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_category_and_quantityunit_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class CategoryAndQuantityUnitRepositoryImpl
    implements CategoryAndQuantityUnitRepository {
  final CategoryAndQuantityUnitDataSource dataSource;

  CategoryAndQuantityUnitRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<CategoryAndQuantityUnitResponse, BountainsError>>
      getCategoryAndQuantityUnit(
          CategoryAndQuantityUnitParams categoryAndQuantityUnitParams) async {
    CategoryAndQuantityUnitPayload categoryAndQuantityUnitPayload =
        CategoryAndQuantityUnitPayload.fromJson(
            categoryAndQuantityUnitParams.toJson());

    try {
      CategoryAndQuantityUnitResponse categoryAndQuantityUnitResponse =
          await dataSource
              .getCategoryAndQuantityUnitData(categoryAndQuantityUnitPayload);
      return Either.left(categoryAndQuantityUnitResponse);
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
