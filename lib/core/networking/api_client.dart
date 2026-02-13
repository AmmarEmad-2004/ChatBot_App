import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final String baseUrl;

  ApiClient({required this.baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {'Content-Type': 'application/json'},
        ),
      );

  Future<Response> post({required String url, required dynamic data}) async {
    return await dio.post(url, data: data);
  }

  Future<Response> get(String url) async {
    return await dio.get(url);
  }
}
