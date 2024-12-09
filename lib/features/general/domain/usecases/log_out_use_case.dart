import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/general/domain/repositories/log_out_repository.dart';
import 'package:fpdart/fpdart.dart';

class LogOutUseCase implements UseCase<bool, NoParams> {
  final LogOutRepository repository;

  const LogOutUseCase({
    required this.repository,
  });

  @override
  Future<Either<bool, BountainsError>> call(NoParams params) async {
    return await repository.logOut(params);
  }
}
