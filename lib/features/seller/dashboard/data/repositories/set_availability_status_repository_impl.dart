import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/set_availability_status_datasource.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/set_availability_status_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class SetAvailabilityRepositoryImpl implements SetAvailabilityRepository {
  final SetAvailabilityDataSource dataSource;

  SetAvailabilityRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<bool, BountainsError>> setAvailability(NoParams param) async {
    try {
      bool setAvailabilityResponse = await dataSource.setAvailability();
      return Either.left(setAvailabilityResponse);
    } on DioException catch (e) {
      return Either.right(
        determineDioError(e),
      );
    } catch (e) {
      return Either.right(
        BountainsError(
          message: "Error: $e",
        ),
      );
    }
  }
}
