import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_orders_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GetOrdersRepository {
  Future<Either<GetOrdersResponse, BountainsError>> getOrders(
    String getOrdersParameters,
  );
}
