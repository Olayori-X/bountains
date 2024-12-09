import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/general/data/datasources/log_out_datasource.dart';
import 'package:bountains/features/general/domain/repositories/log_out_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class LogOutRepositoryImpl implements LogOutRepository {
  final LogOutDataSource dataSource;

  LogOutRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<bool, BountainsError>> logOut(NoParams param) async {
    try {
      bool logOutResponse = await dataSource.logout();
      return Either.left(logOutResponse);
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
