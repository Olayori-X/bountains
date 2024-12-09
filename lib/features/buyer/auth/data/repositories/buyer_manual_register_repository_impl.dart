import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/buyer/auth/data/datasources/buyer_manual_register_datasource.dart';
import 'package:bountains/features/buyer/auth/data/models/buyer_manual_register_model.dart';
import 'package:bountains/features/buyer/auth/domain/entities/buyer_credentials.dart';
import 'package:bountains/features/buyer/auth/domain/repositories/buyer_manual_register_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

class BuyerManualRegisterRepositoryImpl
    implements BuyerManualRegisterRepository {
  final BuyerManualRegisterDataSource dataSource;

  BuyerManualRegisterRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<BuyerCredential, BountainsError>> register(
      BuyerRegistrationParams registrationParams) async {
    BuyerRegisterPayload registerPayload =
        BuyerRegisterPayload.fromJson(registrationParams.toJson());

    try {
      BuyerRegisterResponse registerResponse =
          await dataSource.register(registerPayload);
      // print(jsonEncode(registerResponse.toJson()));
      GetIt.I<UserCredentials>().sellerid = registerResponse.id;

      return Either.left(
        BuyerCredential.fromJson(registerResponse.toJson()),
      );
    } on DioException catch (e) {
      return Either.right(
        determineDioError(e),
      );
    } catch (e) {
      return Either.right(
        BountainsError(
          message: "Error: $e",
        ),
      );
    }
  }
}
