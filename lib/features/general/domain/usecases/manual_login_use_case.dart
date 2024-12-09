import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/repositories/manual_login_repository.dart';
import 'package:fpdart/fpdart.dart';

class ManualLoginUseCase implements UseCase<User, ManualLoginParams> {
  final ManualLoginRepository repository;

  const ManualLoginUseCase({
    required this.repository,
  });

  @override
  Future<Either<User, BountainsError>> call(ManualLoginParams params) async {
    return await repository.login(
      params.email,
      params.password,
      params.latitude,
      params.longitude,
    );
  }
}

class ManualLoginParams {
  final String email;
  final String password;
  final double latitude;
  final double longitude;

  const ManualLoginParams({
    required this.email,
    required this.password,
    required this.latitude,
    required this.longitude,
  });
}
