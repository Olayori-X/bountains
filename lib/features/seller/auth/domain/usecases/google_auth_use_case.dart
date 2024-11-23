import 'package:bountains/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';
import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/domain/repositories/google_auth_repository.dart';

class GoogleAuthUseCase implements UseCase<dynamic, NoParams> {
  final GoogleAuthRepository repository;

  const GoogleAuthUseCase({
    required this.repository,
  });

  @override
  Future<Either<dynamic, BountainsError>> call(NoParams params) async {
    return await repository.signInWithGoogle();
  }
}

class GoogleAuthParams {
  final String idtoken;

  const GoogleAuthParams({
    required this.idtoken,
  });
}
