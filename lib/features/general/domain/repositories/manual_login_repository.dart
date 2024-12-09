import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class ManualLoginRepository {
  Future<Either<User, BountainsError>> login(
    String email,
    String password,
    double latitude,
    double longitude,
  );
}
