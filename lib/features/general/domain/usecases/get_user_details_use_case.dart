import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/repositories/get_user_details_repository.dart';
import 'package:fpdart/fpdart.dart';

class GetUserDetailsUseCase implements UseCase<User, String> {
  final GetUserDetailsRepository repository;

  const GetUserDetailsUseCase({
    required this.repository,
  });

  @override
  Future<Either<User, BountainsError>> call(String params) async {
    return await repository.getUserDetails(params);
  }
}
