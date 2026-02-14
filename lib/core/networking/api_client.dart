import 'package:dio/dio.dart';

class ApiClient {
  final Dio dio;
  final String baseUrl;

  ApiClient({required this.baseUrl, required String apiKey})
    : dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          headers: {'Content-Type': 'application/json'},
          queryParameters: {'key': apiKey},
        ),
      );

  Future<Response> post({required String url, required dynamic data}) async {
    return await dio.post(url, data: data);
  }

}
