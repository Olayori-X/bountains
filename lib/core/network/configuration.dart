import 'package:dio/dio.dart';
export 'package:dio/dio.dart';

const String baseUrl = "https://mansapay.net.ng/bountains/public/api";

const String baseLink = "https://mansapay.net.ng/bountains/";

final Dio dio = Dio(
  BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 60),
  ),
);
