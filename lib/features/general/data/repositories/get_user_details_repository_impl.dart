import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/general/data/datasources/get_user_details_datasource.dart';
import 'package:bountains/features/general/data/models/manual_login_model.dart';
import 'package:bountains/features/general/domain/entities/user.dart';
import 'package:bountains/features/general/domain/repositories/get_user_details_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class GetUserDetailsRepositoryImpl implements GetUserDetailsRepository {
  final GetUserDetailsDataSource dataSource;

  GetUserDetailsRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<User, BountainsError>> getUserDetails(
      String getUserDetailsParam) async {
    try {
      LoginResponse userData =
          await dataSource.getUserDetails(getUserDetailsParam);
      return Either.left(User.fromJson(userData.toJson()));
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
