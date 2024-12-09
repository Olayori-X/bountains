import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_seller_dashboard_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_seller_dashboard_repository.dart';
import 'package:fpdart/fpdart.dart';

class SellerDashboardUseCase
    implements UseCase<SellerDashboardResponse, SellerDashboardUseCaseParams> {
  final SellerDashboardRepository repository;

  const SellerDashboardUseCase({
    required this.repository,
  });

  @override
  Future<Either<SellerDashboardResponse, BountainsError>> call(
      SellerDashboardUseCaseParams params) async {
    return await repository
        .getSellerDashboard(SellerDashboardParams.fromJson(params.toJson()));
  }
}

class SellerDashboardUseCaseParams {
  final String userid;

  const SellerDashboardUseCaseParams({
    required this.userid,
  });

  Map<String, String> toJson() {
    return {
      "userid": userid,
    };
  }
}
