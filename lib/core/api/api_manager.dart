import 'package:dio/dio.dart';

class ApiManager {

  late final Dio dio;

  ApiManager() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://newsapi.org",
      ),
    );
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? params,
  }) {


    return dio.get(
      endPoint,
      queryParameters: params,
    );
  }
}