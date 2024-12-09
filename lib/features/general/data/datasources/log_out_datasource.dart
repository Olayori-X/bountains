import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:get_it/get_it.dart';

abstract interface class LogOutDataSource {
  Future<bool> logout();
}

class LogOutRemoteDataSource implements LogOutDataSource {
  @override
  Future<bool> logout() async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/logout",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    return true;
  }
}
