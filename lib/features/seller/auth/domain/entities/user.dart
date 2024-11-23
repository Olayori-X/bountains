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
  });

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
        fullName: map["fullName"]!,
        sellerid: map['id']!,
        phone: map['phone']!,
        email: map['email']!,
        available: map['available']!,
        vendorName: map['vendorname'],
        description: map['description'],
        accountname: map['accountname'],
        bankName: map['bankname'],
        bankCode: map['bankcode'],
        accountNumber: map['accountnumber'],
        accBal: map['acc_bal'],
        address: map['address']!,
        city: map['city']!,
        street: map['street']!,
        state: map['state']!,
        picture: map['picture'],
        isVerified: map['email_verified_at']);
  }
}
