import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GoogleRegisterRepository {
  Future<Either<User, BountainsError>> register(
    String id,
    String email,
  );
}
