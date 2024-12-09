import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class LogOutRepository {
  Future<Either<bool, BountainsError>> logOut(NoParams params);
}
