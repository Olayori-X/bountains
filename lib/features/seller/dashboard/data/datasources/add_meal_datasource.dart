import 'package:bountains/core/network/configuration.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/dashboard/data/models/add_meal_model.dart';
import 'package:get_it/get_it.dart';

abstract interface class AddMealDataSource {
  Future<bool> create(AddMealPayload payload);
}

class AddMealRemoteDataSource implements AddMealDataSource {
  @override
  Future<bool> create(AddMealPayload payload) async {
    String token = GetIt.I<AppTokens>().accessToken;

    // Initialize the form data map
    Map<String, dynamic> formDataMap = {
      "sellerid": GetIt.I<UserCredentials>().sellerid,
      "description": payload.description,
      "category": payload.category,
      "meal": payload.meal,
      "price": payload.price,
      "quantity_unit": payload.quantityUnit,
    };

    if (payload.picture.isNotEmpty) {
      formDataMap["picture"] = await MultipartFile.fromFile(
        payload.picture,
        filename: 'profile_picture.jpg',
      );
    }

    FormData data = FormData.fromMap(formDataMap);

    await dio.post(
      "/addmeal",
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
