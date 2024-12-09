import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/core/network/token.dart';
import 'package:bountains/features/general/data/datasources/verify_otp_datasource.dart';
import 'package:bountains/features/general/data/models/manual_login_model.dart';
import 'package:bountains/features/general/data/models/verify_otp_model.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/repositories/verify_otp_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';
import 'package:get_it/get_it.dart';

class VerifyOTPRepositoryImpl implements VerifyOTPRepository {
  final VerifyOTPDataSource dataSource;

  VerifyOTPRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<User, BountainsError>> verify(
      VerificationParams verificationParams) async {
    print(verificationParams);
    VerifyPayload verifyPayload =
        VerifyPayload.fromJson(verificationParams.toJson());

    try {
      LoginResponse verifyResponse = await dataSource.verify(verifyPayload);
      GetIt.I<AppTokens>().accessToken = verifyResponse.token;
      GetIt.I<UserCredentials>().sellerid = verifyResponse.id;

      return Either.left(
        User.fromJson(verifyResponse.toJson()),
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
