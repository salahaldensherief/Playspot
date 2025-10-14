import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

import '../errors/error_model.dart';
import '../errors/exceptions.dart';
import 'api_consumer.dart';
import 'api_endpoint.dart';
import 'api_interceptors.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;
  final CookieJar cookieJar;

  DioConsumer({required this.dio, CookieJar? sharedCookieJar})
      : cookieJar = sharedCookieJar ?? CookieJar() {
    dio.options.baseUrl = ApiEndPoint.baseUrl;
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        error: true,
        request: true,
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

  }
  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    Object? data,

    Map<String, dynamic>? queryParameters,
        Options? options,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,

      );
      return response.data;
    } on DioException catch (e) {
      handleDioExceptions(e);
    }
  }
}
