import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/domain/entities/user_credentials.dart';
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
  final String address;
  final String street;
  final String city;
  final String state;

  const RegistrationParams({
    required this.fullname,
    required this.passwordConfirmation,
    required this.address,
    required this.city,
    required this.street,
    required this.state,
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
      "address": address,
      "street": street,
      "city": city,
      "state": state,
    };
  }

  factory RegistrationParams.fromJson(Map<String, String> map) {
    return RegistrationParams(
      fullname: map["fullname"]!,
      email: map["email"]!,
      phone: map["phone"]!,
      password: map["password"]!,
      passwordConfirmation: map["passwordConfirmation"]!,
      address: map["address"]!,
      street: map["street"]!,
      city: map["city"]!,
      state: map["state"]!,
    );
  }
}
