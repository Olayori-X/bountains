class LoginPayload {
  final String email;
  final String password;
  final double latitude;
  final double longitude;

  const LoginPayload({
    required this.email,
    required this.password,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "latitude": latitude,
      "longitude": longitude,
    };
  }
}

class LoginResponse {
  final String id;
  final String fullName;
  final String phone;
  final String email;
  final bool? available;
  final String? vendorName;
  final String? description;
  final String? bankName;
  final String? accountname;
  final String? bankCode;
  final String? accountNumber;
  final String? accBal;
  final String? address;
  final String? city;
  final String? street;
  final String? state;
  final String? picture;
  final String? isVerified;
  final String token;
  final String role;

  const LoginResponse({
    required this.id,
    required this.token,
    required this.fullName,
    required this.phone,
    required this.email,
    this.available,
    this.vendorName,
    this.description,
    this.bankName,
    this.accountname,
    this.bankCode,
    this.accountNumber,
    this.accBal,
    this.address,
    this.city,
    this.street,
    this.state,
    this.picture,
    this.isVerified,
    required this.role,
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
      "role": role
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
    Map<String, dynamic> user = map['user'];
    if (map['role'] == 'vendor') {
      return LoginResponse(
        role: map['role'],
        id: user["sellerid"],
        token: map['token'] ?? "",
        fullName: user["fullname"]!,
        phone: user['phone']!,
        email: user['email']!,
        available: LoginResponse.changeIntToBool(user['available']!),
        vendorName: user['vendorname'],
        description: user['description'],
        bankName: user['bankname'],
        accountname: user['accountname'],
        bankCode: user['bankcode'],
        accountNumber: user['accountnumber'],
        accBal: user['acc_bal'].toString(),
        address: user['address'] ?? "",
        city: user['city'] ?? "",
        street: user['street'] ?? "",
        state: user['state'] ?? "",
        picture: user['picture'],
        isVerified: user['email_verified_at'],
      );
    } else {
      return LoginResponse(
        role: map['role'],
        id: user["buyerid"],
        token: map['token'] ?? "",
        fullName: user["fullname"]!,
        phone: user['phone']!,
        email: user['email']!,
        isVerified: user['email_verified_at'],
      );
    }
  }
}
