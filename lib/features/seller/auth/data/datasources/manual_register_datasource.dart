import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/features/seller/auth/data/models/manual_register_model.dart';

abstract interface class ManualRegisterDataSource {
  Future<RegisterResponse> register(RegisterPayload payload);
}

class ManualRegisterRemoteDataSource implements ManualRegisterDataSource {
  @override
  Future<RegisterResponse> register(RegisterPayload payload) async {
    Response response = await dio.post(
      "/sellersignup",
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    return RegisterResponse.fromJson(responseData);
  }
}
