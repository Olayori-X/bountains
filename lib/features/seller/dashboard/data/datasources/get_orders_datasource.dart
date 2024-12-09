import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_orders_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class GetOrdersDataSource {
  Future<GetOrdersResponse> getOrdersData(String payload);
}

class GetOrdersRemoteDataSource implements GetOrdersDataSource {
  @override
  Future<GetOrdersResponse> getOrdersData(String payload) async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/getorders",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: {"sellerid": payload},
    );

    Map<String, dynamic> responseData = response.data;
    return GetOrdersResponse.fromJson(responseData);
  }
}
