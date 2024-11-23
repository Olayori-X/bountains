import 'package:dio/dio.dart';
import 'error.dart';

BountainsError determineDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.badResponse:
      Map<String, dynamic>? errorData = e.response?.data["error"];
      if (errorData != null) {
        List<String> errorMessages = [];
        errorData.forEach((key, value) {
          if (value is List) {
            errorMessages.addAll(value.map((msg) => msg.toString()));
          }
        });

        String formattedErrors = errorMessages.join(" ");
        return BountainsError(message: formattedErrors);
      } else {
        return BountainsError(message: e.response?.data["message"]);
      }
    case DioExceptionType.connectionError:
      return BountainsError(
        message: "Unable to connect. Please check your internet connection",
      );
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return BountainsError(
        message: "Request timeout. Please try again",
      );
    case DioExceptionType.badCertificate:
      return BountainsError(
        message: "Bad certificate.",
      );
    case DioExceptionType.cancel:
      return BountainsError(
        message: "Request canceled. Please try again",
      );
    case DioExceptionType.unknown:
      return BountainsError(
        message: "An unknown error occurred. Please try again.",
      );
  }
}
