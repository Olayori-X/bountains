import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class GetUserDetailsRepository {
  Future<Either<User, BountainsError>> getUserDetails(
    String getUserDetailsParameters,
  );
}
