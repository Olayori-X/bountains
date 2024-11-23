import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/auth/domain/repositories/google_register_repository.dart';

class GoogleRegisterUseCase implements UseCase<User, GoogleRegisterParams> {
  final GoogleRegisterRepository repository;

  const GoogleRegisterUseCase({
    required this.repository,
  });

  @override
  Future<Either<User, BountainsError>> call(GoogleRegisterParams params) async {
    return await repository.register(
      params.idToken,
      params.email,
    );
  }
}

class GoogleRegisterParams {
  final String idToken;
  final String email;

  const GoogleRegisterParams({
    required this.idToken,
    required this.email,
  });
}
