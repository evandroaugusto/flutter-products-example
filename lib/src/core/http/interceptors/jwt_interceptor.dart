import 'package:app_referencia/src/features/app.routes.dart';
import 'package:app_referencia/src/core/environments/environment.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JwtInterceptor extends Interceptor {
  Dio dio;
  final GlobalKey<NavigatorState> navigatorKey;

  JwtInterceptor({required this.dio, required this.navigatorKey});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var prefs = await SharedPreferences.getInstance();
    var token = prefs.getString(Environment.tokenKey);

    if (token != null) {
      options.headers.putIfAbsent('Authorizarion', () => 'Bearer $token');
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
    }

    super.onError(err, handler);
  }
}
