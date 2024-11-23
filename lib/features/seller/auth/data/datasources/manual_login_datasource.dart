import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/features/seller/auth/data/models/manual_login_model.dart';

abstract interface class ManualLoginDataSource {
  Future<LoginResponse> login(LoginPayload payload);
}

class ManualLoginRemoteDataSourceImpl implements ManualLoginDataSource {
  @override
  Future<LoginResponse> login(LoginPayload payload) async {
    Response response = await dio.post(
      "/loginseller",
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    print(responseData);
    return LoginResponse.fromJson(responseData);
  }
}
