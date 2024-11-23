import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This provider takes user data as input and returns the signup result
final signupProvider =
    FutureProvider.family<Map<String, dynamic>, Map<String, String>>(
        (ref, data) async {
  Dio dio = Dio();

  try {
    // Make a POST request
    Response response = await dio.post(
      'http://127.0.0.1:8000/api/sellersignup',
      data: data,
    );

    if (response.data['response'] == false) {
      return {
        'success': false,
        'message': response.data['error'],
      };
    } else {
      return {
        'success': true,
        'sellerid': response.data['userid'],
      };
    }
  } on DioException catch (e) {
    if (e.response != null) {
      return {
        'success': false,
        'message': 'Server Error: ${e.response!.data}',
      };
    } else {
      return {
        'success': false,
        'message': e.message, // Error not related to the server
      };
    }
  }
});

final verifyProvider =
    FutureProvider.family<Map<String, dynamic>, Map<String, String?>>(
        (ref, data) async {
  Dio dio = Dio();

  try {
    // Make a POST request
    Response response = await dio.post(
      'http://127.0.0.1:8000/api/verifyseller',
      data: data,
    );
    print(response.data);
    if (response.data['response'] == false) {
      return {
        'success': false,
        'message': response.data['message'],
      };
    } else {
      return {
        'success': true,
      };
    }
  } on DioException catch (e) {
    if (e.response != null) {
      return {
        'success': false,
        'message': 'Server Error: ${e.response!.data}',
      };
    } else {
      return {
        'success': false,
        'message': e.message,
      };
    }
  }
});

final loginProvider =
    FutureProvider.family<Map<String, dynamic>, Map<String, String?>>(
        (ref, data) async {
  Dio dio = Dio();

  try {
    // Make a POST request
    Response response = await dio.post(
      'http://127.0.0.1:8000/api/loginseller',
      data: data,
    );
    print(response.data);
    if (response.data['response'] == false) {
      return {
        'success': false,
        'message': response.data['message'],
      };
    } else {
      return {'success': true, 'message': response.data};
    }
  } on DioException catch (e) {
    if (e.response != null) {
      return {
        'success': false,
        'message': 'Server Error: ${e.response!.data}',
      };
    } else {
      return {
        'success': false,
        'message': e.message,
      };
    }
  }
});
