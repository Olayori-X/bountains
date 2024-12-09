import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/buyer/dashboard/data/models/make_order_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class MakeOrderDataSource {
  Future<String> order(MakeOrderPayload payload);
}

class MakeOrderRemoteDataSource implements MakeOrderDataSource {
  @override
  Future<String> order(MakeOrderPayload payload) async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/makeorder",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    return responseData['orderid'] as String;
  }
}
