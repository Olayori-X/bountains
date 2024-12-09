import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/buyer/auth/domain/entities/buyer_credentials.dart';
import 'package:fpdart/fpdart.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/buyer/auth/domain/repositories/buyer_manual_register_repository.dart';

class BuyerManualRegisterUseCase
    implements UseCase<BuyerCredential, BuyerManualRegisterParams> {
  final BuyerManualRegisterRepository repository;

  const BuyerManualRegisterUseCase({
    required this.repository,
  });

  @override
  Future<Either<BuyerCredential, BountainsError>> call(
      BuyerManualRegisterParams params) async {
    return await repository
        .register(BuyerRegistrationParams.fromJson(params.toJson()));
  }
}

class BuyerManualRegisterParams {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const BuyerManualRegisterParams({
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
