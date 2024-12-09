import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/features/general/data/models/manual_login_model.dart';
import 'package:bountains/features/general/data/models/verify_otp_model.dart';

abstract interface class VerifyOTPDataSource {
  Future<LoginResponse> verify(VerifyPayload payload);
}

class VerifyOTPRemoteDataSource implements VerifyOTPDataSource {
  @override
  Future<LoginResponse> verify(VerifyPayload payload) async {
    Response response = await dio.post(
      "/verifyseller",
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    print(responseData);
    return LoginResponse.fromJson(responseData);
  }
}
