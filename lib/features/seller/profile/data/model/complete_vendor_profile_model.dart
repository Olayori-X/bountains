class CompleteVendorProfilePayload {
  final String sellerid;
  final String? description;
  final String bankname;
  final String bankcode;
  final String accountname;
  final String accountnumber;
  final String picture;
  final String vendorname;
  final String address;
  final String city;
  final String street;
  final String state;

  const CompleteVendorProfilePayload({
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
      "city": city,
      "state": state,
      "street": street,
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
      address: map['address'],
      state: map['state'],
      city: map['city'],
      street: map['street'],
    );
  }
}
