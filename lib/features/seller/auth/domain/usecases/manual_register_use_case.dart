import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/domain/entities/user_credentials.dart';
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

  const ManualRegisterParams({
    required this.fullname,
    required this.passwordConfirmation,
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
      "passwordConfirmation": passwordConfirmation
    };
  }
}
