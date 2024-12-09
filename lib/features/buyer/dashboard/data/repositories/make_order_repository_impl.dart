import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/buyer/dashboard/data/datasources/make_order_datasource.dart';
import 'package:bountains/features/buyer/dashboard/data/models/make_order_model.dart';
import 'package:bountains/features/buyer/dashboard/domain/repositories/make_order_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class MakeOrderRepositoryImpl implements MakeOrderRepository {
  final MakeOrderDataSource dataSource;

  MakeOrderRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<String, BountainsError>> makeOrder(
      MakeOrderParams makeOrderParams) async {
    MakeOrderPayload makeOrderPayload =
        MakeOrderPayload.fromJson(makeOrderParams.toJson());

    try {
      String orderId = await dataSource.order(makeOrderPayload);
      return Either.left(orderId);
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
