class RegisterPayload {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;
  final String address;
  final String street;
  final String city;
  final String state;

  const RegisterPayload({
    required this.fullname,
    required this.passwordConfirmation,
    required this.address,
    required this.street,
    required this.city,
    required this.state,
    required this.email,
    required this.phone,
    required this.password,
  });

  Map<String, String> toJson() {
    return {
      "fullname": fullname,
      "email": email,
      "phone": phone,
      "password": password,
      "password_confirmation": passwordConfirmation,
      "address": address,
      "street": street,
      "city": city,
      "state": state
    };
  }

  factory RegisterPayload.fromJson(Map<String, String> map) {
    return RegisterPayload(
      fullname: map["fullname"]!,
      email: map["email"]!,
      phone: map["phone"]!,
      password: map["password"]!,
      passwordConfirmation: map["passwordConfirmation"]!,
      address: map["address"]!,
      street: map["street"]!,
      city: map["city"]!,
      state: map["state"]!,
    );
  }
}

class RegisterResponse {
  final String id;

  const RegisterResponse({
    required this.id,
  });

  Map<String, String> toJson() {
    return {
      "id": id,
    };
  }

  factory RegisterResponse.fromJson(Map<String, dynamic> map) {
    return RegisterResponse(
      id: map["sellerid"]!,
    );
  }
}
