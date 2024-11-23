import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/data/models/verify_otp_model.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class VerifyOTPRepository {
  Future<Either<VerifyResponse, BountainsError>> verify(
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
