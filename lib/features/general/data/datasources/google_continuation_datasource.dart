import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/features/general/data/models/google_authentication_model.dart';
import 'package:bountains/features/general/data/models/manual_login_model.dart';

abstract interface class GoogleContinuationDataSource {
  Future<LoginResponse> login(GoogleAuthPayload payload);
}

class GoogleContinuationRemoteDataSource
    implements GoogleContinuationDataSource {
  @override
  Future<LoginResponse> login(GoogleAuthPayload payload) async {
    Response response = await dio.post(
      "/googleauth",
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    return LoginResponse.fromJson(responseData);
  }
}
