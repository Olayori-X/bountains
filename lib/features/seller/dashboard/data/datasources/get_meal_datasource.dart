import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_meal_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class GetMealsDataSource {
  Future<GetMealsResponse> getMealsData(GetMealsPayload payload);
}

class GetMealsRemoteDataSource implements GetMealsDataSource {
  @override
  Future<GetMealsResponse> getMealsData(GetMealsPayload payload) async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/getmeal",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    return GetMealsResponse.fromJson(responseData);
  }
}
