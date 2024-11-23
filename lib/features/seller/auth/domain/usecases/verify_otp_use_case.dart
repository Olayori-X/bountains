import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/data/models/verify_otp_model.dart';
import 'package:bountains/features/seller/auth/domain/repositories/verify_otp_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:bountains/core/usecase/usecase.dart';

class VerifyOTPUseCase implements UseCase<VerifyResponse, VerifyParams> {
  final VerifyOTPRepository repository;

  const VerifyOTPUseCase({
    required this.repository,
  });

  @override
  Future<Either<VerifyResponse, BountainsError>> call(
      VerifyParams params) async {
    return await repository
        .verify(VerificationParams.fromJson(params.toJson()));
  }
}

class VerifyParams {
  final String userid;
  final String otp;

  const VerifyParams({
    required this.userid,
    required this.otp,
  });

  Map<String, String> toJson() {
    return {"userid": userid, "otp": otp};
  }
}
