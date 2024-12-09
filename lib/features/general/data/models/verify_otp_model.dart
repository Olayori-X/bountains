class VerifyPayload {
  final String userid;
  final String otp;

  const VerifyPayload({
    required this.userid,
    required this.otp,
  });

  Map<String, String> toJson() {
    return {"userid": userid, "otp": otp};
  }

  factory VerifyPayload.fromJson(Map<String, String> map) {
    return VerifyPayload(
      userid: map["userid"]!,
      otp: map["otp"]!,
    );
  }
}

class VerifyResponse {
  final bool response;
  final String message;

  const VerifyResponse({required this.response, required this.message});

  Map<String, dynamic> toJson() {
    return {"response": response, "message": message};
  }

  factory VerifyResponse.fromJson(Map<String, dynamic> map) {
    return VerifyResponse(
      response: map["response"]!,
      message: map["message"]!,
    );
  }
}
