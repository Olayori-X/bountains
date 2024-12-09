import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/buyer/dashboard/domain/entities/order.dart';
import 'package:bountains/features/buyer/dashboard/domain/repositories/make_order_repository.dart';
import 'package:fpdart/fpdart.dart';

class MakeOrderUseCase implements UseCase<String, MakeOrderUseCaseParams> {
  final MakeOrderRepository repository;

  const MakeOrderUseCase({
    required this.repository,
  });

  @override
  Future<Either<String, BountainsError>> call(
      MakeOrderUseCaseParams params) async {
    return await repository
        .makeOrder(MakeOrderParams.fromJson(params.toJson()));
  }
}

class MakeOrderUseCaseParams {
  final String buyerid;
  final List<Orders> meals;
  final double latitude;
  final double longitude;

  const MakeOrderUseCaseParams({
    required this.buyerid,
    required this.meals,
    this.latitude = 0,
    this.longitude = 0,
  });

  Map<String, dynamic> toJson() {
    return {
      "buyerid": buyerid,
      "meals": meals.map((m) => m.toJson()).toList(),
      "latitude": latitude,
      "longitude": longitude,
    };
  }

  factory MakeOrderUseCaseParams.fromJson(Map<String, dynamic> map) {
    return MakeOrderUseCaseParams(
      buyerid: map["buyerid"] ?? "",
      meals: (map["meals"] as List<dynamic>)
          .map((item) => Orders.fromJson(item))
          .toList(),
      latitude: map['latitude'] ?? 0,
      longitude: map['longitude'] ?? 0,
    );
  }
}
