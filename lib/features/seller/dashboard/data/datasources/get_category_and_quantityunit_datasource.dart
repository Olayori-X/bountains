import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_category_and_quantityunit_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class CategoryAndQuantityUnitDataSource {
  Future<CategoryAndQuantityUnitResponse> getCategoryAndQuantityUnitData(
      CategoryAndQuantityUnitPayload payload);
}

class CategoryAndQuantityUnitRemoteDataSource
    implements CategoryAndQuantityUnitDataSource {
  @override
  Future<CategoryAndQuantityUnitResponse> getCategoryAndQuantityUnitData(
      CategoryAndQuantityUnitPayload payload) async {
    String token = GetIt.I<AppTokens>().accessToken;
    Response response = await dio.post(
      "/getquantityandcategory",
      options: Options(
        headers: {
          "Authorization": "Bearer $token",
        },
      ),
      data: payload.toJson(),
    );

    Map<String, dynamic> responseData = response.data;
    print(responseData);
    return CategoryAndQuantityUnitResponse.fromJson(responseData);
  }
}
