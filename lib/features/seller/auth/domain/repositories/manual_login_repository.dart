import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ManualLoginRepository {
  Future<Either<User, BountainsError>> login(String email, String password);
}
