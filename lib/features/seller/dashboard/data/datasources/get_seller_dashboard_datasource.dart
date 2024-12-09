import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_seller_dashboard_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class SellerDashboardDataSource {
  Future<SellerDashboardResponse> getSellerDashboardData(
      SellerDashboardPayload payload);
}

class SellerDashboardRemoteDataSource implements SellerDashboardDataSource {
  @override
  Future<SellerDashboardResponse> getSellerDashboardData(
      SellerDashboardPayload payload) async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/sellerdashboard",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    print(responseData);
    return SellerDashboardResponse.fromJson(responseData);
  }
}
