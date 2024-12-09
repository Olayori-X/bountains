import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/general/data/datasources/google_continuation_datasource.dart';
import 'package:bountains/features/general/data/models/google_authentication_model.dart';
import 'package:bountains/features/general/data/models/manual_login_model.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/repositories/google_continuation_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

class GoogleContinuationRepositoryImpl implements GoogleContinuationRepository {
  final GoogleContinuationDataSource dataSource;

  GoogleContinuationRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<User, BountainsError>> continueWithGoogle(
    String idToken,
    String email,
    String displayName,
    String role,
  ) async {
    GoogleAuthPayload loginPayload = GoogleAuthPayload(
      idToken: idToken,
      email: email,
      displayName: displayName,
      role: role,
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
