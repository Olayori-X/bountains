import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/buyer/auth/domain/entities/buyer_credentials.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class BuyerManualRegisterRepository {
  Future<Either<BuyerCredential, BountainsError>> register(
    BuyerRegistrationParams registrationParameters,
  );
}

class BuyerRegistrationParams {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const BuyerRegistrationParams({
    required this.fullname,
    required this.passwordConfirmation,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password,
      "passwordConfirmation": passwordConfirmation,
    };
  }

  factory BuyerRegistrationParams.fromJson(Map<String, String> map) {
    return BuyerRegistrationParams(
      fullname: map["fullname"]!,
      email: map["email"]!,
      phone: map["phone"]!,
      password: map["password"]!,
      passwordConfirmation: map["passwordConfirmation"]!,
    );
  }
}
