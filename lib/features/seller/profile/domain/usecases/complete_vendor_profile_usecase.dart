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
  final String address;
  final String street;
  final String city;
  final String state;

  const CompleteVendorProfileParams({
    required this.sellerid,
    this.description = " ",
    required this.bankname,
    required this.bankcode,
    required this.accountname,
    required this.accountnumber,
    required this.picture,
    required this.vendorname,
    required this.address,
    required this.city,
    required this.state,
    required this.street,
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
      "address": address,
      "street": street,
      "city": city,
      "state": state,
    };
  }
}
