import 'package:bountains/core/error/error.dart';
import 'package:bountains/features/seller/profile/domain/usecases/complete_vendor_profile_usecase.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class CompleteVendorProfileRepository {
  Future<Either<bool, BountainsError>> create(
      CompleteVendorProfileParams params);
}
