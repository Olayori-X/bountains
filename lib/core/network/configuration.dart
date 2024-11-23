import 'package:dio/dio.dart';
export 'package:dio/dio.dart';

const String baseUrl = "https://cc3e-102-89-85-204.ngrok-free.app/api";

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ),
);
