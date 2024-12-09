import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/set_availability_status_repository.dart';
import 'package:fpdart/fpdart.dart';

class SetAvailabilityUseCase implements UseCase<bool, NoParams> {
  final SetAvailabilityRepository repository;

  const SetAvailabilityUseCase({
    required this.repository,
  });

  @override
  Future<Either<bool, BountainsError>> call(NoParams params) async {
    return await repository.setAvailability(params);
  }
}
