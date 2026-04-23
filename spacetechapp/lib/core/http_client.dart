import 'package:dio/dio.dart';

class CustomHttpClient {
  final Dio dio;
  final String baseUrl;

  CustomHttpClient({this.baseUrl = 'https://gdapp.com.br/api/fiap'})
    : dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    return await dio.post(path, data: data, queryParameters: queryParameters);
  }
}
