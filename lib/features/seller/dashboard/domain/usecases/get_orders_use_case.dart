import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_orders_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_orders_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetOrdersUseCase implements UseCase<GetOrdersResponse, String> {
  final GetOrdersRepository repository;

  const GetOrdersUseCase({
    required this.repository,
  });

  @override
  Future<Either<GetOrdersResponse, BountainsError>> call(String params) async {
    return await repository.getOrders(params);
  }
}
