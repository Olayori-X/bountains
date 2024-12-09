import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/buyer/dashboard/data/models/get_food_for_shop_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class MealsForShopDataSource {
  Future<MealsForShopResponse> getMealsForShopData(MealsForShopPayload payload);
}

class MealsForShopRemoteDataSource implements MealsForShopDataSource {
  @override
  Future<MealsForShopResponse> getMealsForShopData(
      MealsForShopPayload payload) async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/buyerdashboard",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    return MealsForShopResponse.fromJson(responseData);
  }
}
