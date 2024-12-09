import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GoogleContinuationRepository {
  Future<Either<User, BountainsError>> continueWithGoogle(
    String idToken,
    String email,
    String displayName,
    String role,
  );
}
