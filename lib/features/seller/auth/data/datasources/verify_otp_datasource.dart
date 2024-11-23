import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/features/seller/auth/data/models/verify_otp_model.dart';

abstract interface class VerifyOTPDataSource {
  Future<VerifyResponse> verify(VerifyPayload payload);
}

class VerifyOTPRemoteDataSource implements VerifyOTPDataSource {
  @override
  Future<VerifyResponse> verify(VerifyPayload payload) async {
    Response response = await dio.post(
      "/verifyseller",
      data: payload.toJson(),
    );

    print('hello');
    print(response);
    Map<String, dynamic> responseData = response.data;
    print(responseData);
    return VerifyResponse.fromJson(responseData);
  }
}
