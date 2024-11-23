class CompleteVendorProfilePayload {
  final String sellerid;
  final String? description;
  final String bankname;
  final String bankcode;
  final String accountname;
  final String accountnumber;
  final String picture;
  final String vendorname;

  const CompleteVendorProfilePayload({
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

  factory CompleteVendorProfilePayload.fromJson(Map<String, dynamic> map) {
    return CompleteVendorProfilePayload(
      sellerid: map["sellerid"],
      description: map["description"],
      bankname: map["bankname"],
      bankcode: map["bankcode"],
      accountname: map["accountname"],
      accountnumber: map["accountnumber"],
      picture: map["picture"],
      vendorname: map['vendorname'],
    );
  }
}
