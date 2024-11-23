import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/seller/profile/data/datasource/complete_vendor_profile_datasource.dart';
import 'package:bountains/features/seller/profile/data/model/complete_vendor_profile_model.dart';
import 'package:bountains/features/seller/profile/domain/repositories/complete_vendor_profile_repository.dart';
import 'package:bountains/features/seller/profile/domain/usecases/complete_vendor_profile_usecase.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class CompleteVendorProfileRepositoryImpl
    implements CompleteVendorProfileRepository {
  final CompleteVendorProfileDataSource dataSource;

  CompleteVendorProfileRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<bool, BountainsError>> create(
      CompleteVendorProfileParams params) async {
    CompleteVendorProfilePayload creationPayload =
        CompleteVendorProfilePayload.fromJson(params.toJson());

    try {
      bool response = await dataSource.create(creationPayload);
      return Either.left(response);
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
