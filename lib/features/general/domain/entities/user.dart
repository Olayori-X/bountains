class User {
  final String sellerid;
  final String fullName;
  final String phone;
  final String email;
  final bool available;
  final String? vendorName;
  final String? description;
  final String? bankName;
  final String? accountname;
  final String? bankCode;
  final String? accountNumber;
  final String? accBal;
  final String address;
  final String city;
  final String street;
  final String state;
  final String? picture;
  final String? isVerified;
  final String role;

  const User({
    required this.sellerid,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.available,
    this.vendorName,
    this.description,
    this.bankName,
    this.accountname,
    this.bankCode,
    this.accountNumber,
    this.accBal,
    required this.address,
    required this.city,
    required this.street,
    required this.state,
    this.picture,
    this.isVerified,
    required this.role,
  });

  Map<String, dynamic> toJson() {
    return {
      "sellerid": sellerid,
      "fullName": fullName,
      "phone": phone,
      "email": email,
      "available": available,
      "description": description,
      "picture": picture,
      "vendorName": vendorName,
      "bankName": bankName,
      "accountname": accountname,
      "accountNumber": accountNumber,
      "accBal": accBal,
      "address": address,
      "city": city,
      "street": street,
      "state": state,
      "isVerified": isVerified,
      "role": role,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      fullName: map["fullName"] ?? map['fullname'],
      sellerid: map['id'] ?? map['sellerid'] ?? map['buyerid'],
      phone: map['phone']!,
      email: map['email']!,
      available: map['available'] ?? false,
      vendorName: map['vendorname'] ?? "",
      description: map['description'] ?? "",
      accountname: map['accountname'] ?? "",
      bankName: map['bankname'] ?? "",
      bankCode: map['bankcode'] ?? "",
      accountNumber: map['accountnumber'],
      accBal: map['acc_bal'] ?? "0",
      address: map['address'] ?? "",
      city: map['city'] ?? "",
      street: map['street'] ?? "",
      state: map['state'] ?? "",
      picture: map['picture'] ?? "",
      isVerified: map['email_verified_at'],
      role: map['role'] ?? "",
    );
  }
}
