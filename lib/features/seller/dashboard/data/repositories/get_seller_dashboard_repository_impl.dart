import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/error/handler.dart';
import 'package:bountains/features/seller/dashboard/data/datasources/get_seller_dashboard_datasource.dart';
import 'package:bountains/features/seller/dashboard/data/models/get_seller_dashboard_model.dart';
import 'package:bountains/features/seller/dashboard/domain/repositories/get_seller_dashboard_repository.dart';
import 'package:dio/dio.dart' show DioException;
import 'package:fpdart/fpdart.dart';

class SellerDashboardRepositoryImpl implements SellerDashboardRepository {
  final SellerDashboardDataSource dataSource;

  SellerDashboardRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Either<SellerDashboardResponse, BountainsError>> getSellerDashboard(
      SellerDashboardParams sellerDashboardParams) async {
    SellerDashboardPayload sellerDashboardPayload =
        SellerDashboardPayload.fromJson(sellerDashboardParams.toJson());

    try {
      SellerDashboardResponse sellerDashboardResponse =
          await dataSource.getSellerDashboardData(sellerDashboardPayload);
      return Either.left(sellerDashboardResponse);
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
