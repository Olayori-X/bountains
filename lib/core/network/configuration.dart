import 'package:dio/dio.dart';
export 'package:dio/dio.dart';

const String baseUrl = "https://90df-105-115-2-57.ngrok-free.app/api";

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ),
);
