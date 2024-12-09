/// This is the object used to model the payload sent to the backend after Google authentication was successful
class GoogleAuthPayload {
  final String? email;
  final String? idToken;
  final String? displayName;
  final String role;

  const GoogleAuthPayload({
    required this.email,
    required this.idToken,
    required this.role,
    required this.displayName,
  });

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "idToken": idToken,
      "role": role,
      "fullname": displayName,
    };
  }
}

/// This is the object used to model the response gotten from Google after authentication was successful
class GoogleAuthResponse {
  final String? email;
  final String? displayName;
  final String? id;

  const GoogleAuthResponse({
    required this.email,
    required this.displayName,
    required this.id,
  });

  Map<String, String?> toJson() {
    return {
      "email": email,
      "displayName": displayName,
      "idToken": id,
    };
  }

  factory GoogleAuthResponse.fromJson(Map<String, dynamic> map) {
    return GoogleAuthResponse(
      email: map['email'],
      displayName: map['displayName'],
      id: map['id'],
    );
  }
}
