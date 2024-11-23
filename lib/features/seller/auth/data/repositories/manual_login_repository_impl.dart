import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/seller/auth/data/datasources/manual_login_datasource.dart';
import 'package:bountains/features/seller/auth/data/models/manual_login_model.dart';
import 'package:bountains/features/seller/auth/domain/entities/user.dart';
import 'package:bountains/features/seller/auth/domain/repositories/manual_login_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

class ManualLoginRepositoryImpl implements ManualLoginRepository {
  final ManualLoginDataSource dataSource;

  ManualLoginRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<User, BountainsError>> login(
    String email,
    String password,
  ) async {
    LoginPayload loginPayload = LoginPayload(
      email: email,
      password: password,
    );

    try {
      LoginResponse loginResponse = await dataSource.login(loginPayload);
      GetIt.I<AppTokens>().accessToken = loginResponse.token;
      GetIt.I<UserCredentials>().sellerid = loginResponse.id;

      return Either.left(
        User.fromJson(loginResponse.toJson()),
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
