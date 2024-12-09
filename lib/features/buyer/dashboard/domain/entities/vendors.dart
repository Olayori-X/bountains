class Vendors {
  final String sellerid;
  final String fullname;
  final String phone;
  final String email;
  final bool available;
  final String? vendorName;
  final String? description;
  final String? bankname;
  final String? accountname;
  final String? bankcode;
  final String? accountNumber;
  final String? accBal;
  final String address;
  final String city;
  final double distance;
  final String street;
  final String state;
  final String? picture;

  const Vendors({
    required this.sellerid,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.available,
    this.vendorName,
    this.description,
    this.bankname,
    this.accountname,
    this.bankcode,
    this.accountNumber,
    this.accBal,
    required this.address,
    required this.city,
    required this.street,
    required this.state,
    this.picture,
    required this.distance,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerid": sellerid,
      "fullname": fullname,
      "phone": phone,
      "email": email,
      "available": available,
      "description": description,
      "picture": picture,
      "vendorName": vendorName,
      "bankname": bankname,
      "accountname": accountname,
      "accountNumber": accountNumber,
      "accBal": accBal,
      "address": address,
      "city": city,
      "street": street,
      "state": state,
      "distance": distance,
    };
  }

  static bool changeIntToBool(value) {
    if (value == 1) {
      return true;
    } else {
      return false;
    }
  }

  factory Vendors.fromJson(Map<String, dynamic> map) {
    return Vendors(
      fullname: map["fullname"]!,
      sellerid: map['sellerid']!,
      phone: map['phone']!,
      email: map['email']!,
      available: Vendors.changeIntToBool(map['available'] ?? 0),
      vendorName: map['vendorname'] ?? "",
      description: map['description'] ?? "",
      accountname: map['accountname'] ?? "",
      bankname: map['bankname'] ?? "",
      bankcode: map['bankcode'] ?? "",
      accountNumber: map['accountnumber'],
      accBal: map['acc_bal'].toString(),
      address: map['address'] ?? "",
      city: map['city'] ?? "",
      street: map['street'] ?? "",
      state: map['state'] ?? "",
      picture: map['picture'] ?? "",
      distance: map['distamce'] ?? 0,
    );
  }
}
