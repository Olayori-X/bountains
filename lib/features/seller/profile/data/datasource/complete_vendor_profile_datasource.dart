import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/profile/data/model/complete_vendor_profile_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class CompleteVendorProfileDataSource {
  Future<bool> create(CompleteVendorProfilePayload payload);
}

class CompleteVendorProfileRemoteDataSource
    implements CompleteVendorProfileDataSource {
  @override
  Future<bool> create(CompleteVendorProfilePayload payload) async {
    String token = GetIt.I<AppTokens>().accessToken;

    FormData data = FormData.fromMap({
      "sellerid": payload.sellerid,
      "description": payload.description ?? "",
      "bankname": payload.bankname,
      "bankcode": payload.bankcode,
      "accountname": payload.accountname,
      "accountnumber": payload.accountnumber,
      "vendorname": payload.vendorname,
      "picture": await MultipartFile.fromFile(
        payload.picture,
        filename: 'profile_picture.jpg',
      ),
    });

    await dio.post(
      "/completeprofile",
      data: data,
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data"
        },
      ),
    );

    return true;
  }
}
