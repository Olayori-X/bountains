class RegisterPayload {
  final String fullname;
  final String email;
  final String phone;
  final String password;
  final String passwordConfirmation;

  const RegisterPayload({
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

  factory RegisterPayload.fromJson(Map<String, String> map) {
    return RegisterPayload(
      fullname: map["fullname"]!,
      email: map["email"]!,
      phone: map["phone"]!,
      password: map["password"]!,
      passwordConfirmation: map["passwordConfirmation"]!,
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
