import 'package:bountains/core/error/error.dart';
import 'package:bountains/core/usecase/usecase.dart';
import 'package:bountains/features/seller/profile/domain/repositories/complete_vendor_profile_repository.dart';
import 'package:fpdart/fpdart.dart';

class CompleteVendorProfileUseCase
    implements UseCase<bool, CompleteVendorProfileParams> {
  final CompleteVendorProfileRepository repository;

  const CompleteVendorProfileUseCase({
    required this.repository,
  });

  @override
  Future<Either<bool, BountainsError>> call(
      CompleteVendorProfileParams params) async {
    return await repository.create(params);
  }
}

class CompleteVendorProfileParams {
  final String sellerid;
  final String? description;
  final String? bankname;
  final String? bankcode;
  final String accountname;
  final String accountnumber;
  final String? picture;
  final String vendorname;

  const CompleteVendorProfileParams({
    required this.sellerid,
    this.description = " ",
    required this.bankname,
    required this.bankcode,
    required this.accountname,
    required this.accountnumber,
    required this.picture,
    required this.vendorname,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerid": sellerid,
      "description": description,
      "bankname": bankname,
      "bankcode": bankcode,
      "accountname": accountname,
      "accountnumber": accountnumber,
      "picture": picture,
      "vendorname": vendorname,
    };
  }
}
