class BuyerRegisterPayload {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const BuyerRegisterPayload({
    required this.fullname,
    required this.passwordConfirmation,
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
    };
  }

  factory BuyerRegisterPayload.fromJson(Map<String, String> map) {
    return BuyerRegisterPayload(
      fullname: map["fullname"]!,
      email: map["email"]!,
      phone: map["phone"]!,
      password: map["password"]!,
      passwordConfirmation: map["passwordConfirmation"]!,
    );
  }
}

class BuyerRegisterResponse {
  final String id;

  const BuyerRegisterResponse({
    required this.id,
  });

  Map<String, String> toJson() {
    return {
      "id": id,
    };
  }

  factory BuyerRegisterResponse.fromJson(Map<String, dynamic> map) {
    return BuyerRegisterResponse(
      id: map["buyerid"]!,
    );
  }
}
