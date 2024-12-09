import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/domain/entities/user_credentials.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ManualRegisterRepository {
  Future<Either<UserCredential, BountainsError>> register(
    RegistrationParams registrationParameters,
  );
}

class RegistrationParams {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const RegistrationParams({
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

  factory RegistrationParams.fromJson(Map<String, String> map) {
    return RegistrationParams(
      fullname: map["fullname"]!,
      email: map["email"]!,
      phone: map["phone"]!,
      password: map["password"]!,
      passwordConfirmation: map["passwordConfirmation"]!,
    );
  }
}
