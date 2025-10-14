import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_preferences_singleton.dart';


class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = Prefs.getString('auth_token');
    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = 'application/json';

    handler.next(options);
  }
}
