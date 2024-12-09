import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/repositories/verify_otp_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:bountains/core/usecase/usecase.dart';

class VerifyOTPUseCase implements UseCase<User, VerifyParams> {
  final VerifyOTPRepository repository;

  const VerifyOTPUseCase({
    required this.repository,
  });

  @override
  Future<Either<User, BountainsError>> call(VerifyParams params) async {
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
