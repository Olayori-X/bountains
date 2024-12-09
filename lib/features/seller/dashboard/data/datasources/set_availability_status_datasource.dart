import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:get_it/get_it.dart';

abstract interface class SetAvailabilityDataSource {
  Future<bool> setAvailability();
}

class SetAvailabilityRemoteDataSource implements SetAvailabilityDataSource {
  @override
  Future<bool> setAvailability() async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/checkout",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
    );

    return true;
  }
}
