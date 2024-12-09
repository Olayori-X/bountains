import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_seller_dashboard_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SellerDashboardRepository {
  Future<Either<SellerDashboardResponse, BountainsError>> getSellerDashboard(
    SellerDashboardParams sellerDashboardParameters,
  );
}

class SellerDashboardParams {
  final String userid;

  const SellerDashboardParams({
    required this.userid,
  });

  Map<String, String> toJson() {
    return {
      "userid": userid,
    };
  }

  factory SellerDashboardParams.fromJson(Map<String, String> map) {
    return SellerDashboardParams(
      userid: map["userid"]!,
    );
  }
}
