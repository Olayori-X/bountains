import 'package:bountains/core/error/error.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GoogleAuthRepository {
  Future<Either<dynamic, BountainsError>> signInWithGoogle();
  Future<void> signOutFromGoogle();
}
