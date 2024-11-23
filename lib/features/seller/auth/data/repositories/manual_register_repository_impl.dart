import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/auth/data/datasources/manual_register_datasource.dart';
import 'package:bountains/features/seller/auth/data/models/manual_register_model.dart';
import 'package:bountains/features/seller/auth/domain/entities/user_credentials.dart';
import 'package:bountains/features/seller/auth/domain/repositories/manual_register_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

class ManualRegisterRepositoryImpl implements ManualRegisterRepository {
  final ManualRegisterDataSource dataSource;

  ManualRegisterRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<UserCredential, BountainsError>> register(
      RegistrationParams registrationParams) async {
    RegisterPayload registerPayload =
        RegisterPayload.fromJson(registrationParams.toJson());

    try {
      RegisterResponse registerResponse =
          await dataSource.register(registerPayload);
      // print(jsonEncode(registerResponse.toJson()));
      GetIt.I<UserCredentials>().sellerid = registerResponse.id;

      return Either.left(
        UserCredential.fromJson(registerResponse.toJson()),
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
