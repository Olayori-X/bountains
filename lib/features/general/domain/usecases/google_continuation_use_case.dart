import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/repositories/google_continuation_repository.dart';
import 'package:fpdart/fpdart.dart';

class GoogleContinuationUseCase
    implements UseCase<User, GoogleContinuationParams> {
  final GoogleContinuationRepository repository;

  const GoogleContinuationUseCase({
    required this.repository,
  });

  @override
  Future<Either<User, BountainsError>> call(
      GoogleContinuationParams params) async {
    return await repository.continueWithGoogle(
      params.idToken,
      params.email,
      params.displayName,
      params.role,
    );
  }
}

class GoogleContinuationParams {
  final String idToken;
  final String email;
  final String displayName;
  final String role;

  const GoogleContinuationParams({
    required this.idToken,
    required this.email,
    required this.displayName,
    required this.role,
  });
}
