import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/auth/domain/entities/user.dart';
import 'package:bountains/features/seller/auth/domain/repositories/manual_login_repository.dart';
import 'package:fpdart/fpdart.dart';

class ManualLoginUseCase implements UseCase<User, ManualLoginParams> {
  final ManualLoginRepository repository;

  const ManualLoginUseCase({
    required this.repository,
  });

  @override
  Future<Either<User, BountainsError>> call(ManualLoginParams params) async {
    return await repository.login(params.email, params.password);
  }
}

class ManualLoginParams {
  final String email;
  final String password;

  const ManualLoginParams({
    required this.email,
    required this.password,
  });
}
