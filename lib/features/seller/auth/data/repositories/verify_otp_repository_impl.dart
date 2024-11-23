import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/seller/auth/data/datasources/verify_otp_datasource.dart';
import 'package:bountains/features/seller/auth/data/models/verify_otp_model.dart';
import 'package:bountains/features/seller/auth/domain/repositories/verify_otp_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class VerifyOTPRepositoryImpl implements VerifyOTPRepository {
  final VerifyOTPDataSource dataSource;

  VerifyOTPRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<VerifyResponse, BountainsError>> verify(
      VerificationParams verificationParams) async {
    print(verificationParams);
    VerifyPayload verifyPayload =
        VerifyPayload.fromJson(verificationParams.toJson());

    try {
      VerifyResponse verifyResponse = await dataSource.verify(verifyPayload);

      return Either.left(
        VerifyResponse.fromJson(verifyResponse.toJson()),
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
