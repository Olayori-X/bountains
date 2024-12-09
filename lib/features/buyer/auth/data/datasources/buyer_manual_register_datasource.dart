import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/features/buyer/auth/data/models/buyer_manual_register_model.dart';

abstract interface class BuyerManualRegisterDataSource {
  Future<BuyerRegisterResponse> register(BuyerRegisterPayload payload);
}

class BuyerManualRegisterRemoteDataSource
    implements BuyerManualRegisterDataSource {
  @override
  Future<BuyerRegisterResponse> register(BuyerRegisterPayload payload) async {
    Response response = await dio.post(
      "/buyersignup",
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    return BuyerRegisterResponse.fromJson(responseData);
  }
}
