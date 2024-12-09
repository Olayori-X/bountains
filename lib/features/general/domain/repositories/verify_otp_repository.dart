import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class VerifyOTPRepository {
  Future<Either<User, BountainsError>> verify(
    VerificationParams verificationParameters,
  );
}

class VerificationParams {
  final String userid;
  final String otp;

  const VerificationParams({
    required this.userid,
    required this.otp,
  });

  Map<String, String> toJson() {
    return {
      "userid": userid,
      "otp": otp,
    };
  }

  factory VerificationParams.fromJson(Map<String, String> map) {
    return VerificationParams(
      userid: map["userid"]!,
      otp: map["otp"]!,
    );
  }
}
