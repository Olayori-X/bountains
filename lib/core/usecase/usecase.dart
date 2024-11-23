import 'package:fpdart/fpdart.dart';
import 'package:bountains/core/error/error.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<SuccessType, BountainsError>> call(Params params);
}

class NoParams {
  const NoParams();
}
