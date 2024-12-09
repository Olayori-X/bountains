import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/general/data/models/manual_login_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class GetUserDetailsDataSource {
  Future<LoginResponse> getUserDetails(String payload);
}

class GetUserDetailsRemoteDataSource implements GetUserDetailsDataSource {
  @override
  Future<LoginResponse> getUserDetails(String payload) async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/getuserdetails",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: {'userid': payload},
    );

    Map<String, dynamic> responseData = response.data;
    print(responseData);
    return LoginResponse.fromJson(responseData);
  }
}
