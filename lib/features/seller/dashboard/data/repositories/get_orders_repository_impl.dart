import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_orders_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_orders_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_orders_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class GetOrdersRepositoryImpl implements GetOrdersRepository {
  final GetOrdersDataSource dataSource;

  GetOrdersRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<GetOrdersResponse, BountainsError>> getOrders(
      String getOrdersParam) async {
    try {
      GetOrdersResponse orderData =
          await dataSource.getOrdersData(getOrdersParam);
      return Either.left(orderData);
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
