class LoginPayload {
  final String email;
  final String password;

  const LoginPayload({
    required this.email,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}

class LoginResponse {
  final String id;
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
  final String token;

  const LoginResponse({
    required this.id,
    required this.token,
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
  });

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "id": id,
      "fullName": fullName,
      "email": email,
      "phone": phone,
      "available": available,
      "vendorname": vendorName,
      "description": description,
      "bankname": bankName,
      "bankcode": bankCode,
      "accountname": accountname,
      "accountnumber": accountNumber,
      "acc_bal": accBal,
      "address": address,
      "city": city,
      "street": street,
      "state": state,
      "picture": picture,
      "email_verified_at": isVerified,
    };
  }

  static bool changeIntToBool(value) {
    if (value == 1) {
      return true;
    } else {
      return false;
    }
  }

  factory LoginResponse.fromJson(Map<String, dynamic> map) {
    Map<String, dynamic> seller = map['seller'];
    return LoginResponse(
        id: seller["sellerid"],
        token: map['token'],
        fullName: seller["fullname"]!,
        phone: seller['phone']!,
        email: seller['email']!,
        available: LoginResponse.changeIntToBool(seller['available']!),
        vendorName: seller['vendorname'],
        description: seller['description'],
        bankName: seller['bankname'],
        accountname: seller['accountname'],
        bankCode: seller['bankcode'],
        accountNumber: seller['accountnumber'],
        accBal: seller['acc_bal'],
        address: seller['address']!,
        city: seller['city']!,
        street: seller['street']!,
        state: seller['state']!,
        picture: seller['picture'],
        isVerified: seller['email_verified_at']);
  }
}
