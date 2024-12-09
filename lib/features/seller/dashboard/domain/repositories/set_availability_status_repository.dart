import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class SetAvailabilityRepository {
  Future<Either<bool, BountainsError>> setAvailability(NoParams params);
}
