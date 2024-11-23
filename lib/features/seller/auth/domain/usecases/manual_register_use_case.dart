import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/domain/entities/user_credentials.dart';
import 'package:fpdart/fpdart.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/auth/domain/repositories/manual_register_repository.dart';

class ManualRegisterUseCase
    implements UseCase<UserCredential, ManualRegisterParams> {
  final ManualRegisterRepository repository;

  const ManualRegisterUseCase({
    required this.repository,
  });

  @override
  Future<Either<UserCredential, BountainsError>> call(
      ManualRegisterParams params) async {
    return await repository
        .register(RegistrationParams.fromJson(params.toJson()));
  }
}

class ManualRegisterParams {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;
  final String address;
  final String street;
  final String city;
  final String state;

  const ManualRegisterParams({
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
      "email": email,
      "phone": phone,
      "password": password,
      'fullname': fullname,
      'address': address,
      'street': street,
      'city': city,
      "state": state,
      "passwordConfirmation": passwordConfirmation
    };
  }
}
