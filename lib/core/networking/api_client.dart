import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final String baseUrl;

  ApiClient({required this.baseUrl})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {'Content-Type': 'application/json'},
          // queryParameters: {'key': apiKey},
        ),
      );

  Future<Response> post({
    required String url,
    required dynamic data,
    String? apiKey,
  }) async {
    return await dio.post(
      url,
      data: data,
      queryParameters: apiKey != null ? {'key': apiKey} : null,
    );
  }
}
