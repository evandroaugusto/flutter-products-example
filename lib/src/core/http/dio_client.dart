import 'package:app_referencia/src/app.dart';
import 'package:app_referencia/src/core/http/interceptors/jwt_interceptor.dart';
import 'package:dio/dio.dart';
import '../environments/environment.dart';
import 'interceptors/error_interceptor.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();
  factory DioClient() => _singleton;

  late Dio instance;

  DioClient._internal() {
    instance = Dio()
      ..options.baseUrl = Environment.api
      ..options.connectTimeout = 15000
      ..options.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'};

    instance.interceptors.addAll([
      JwtInterceptor(dio: instance, navigatorKey: navigatorKey),
      ErrorInterceptor(),
    ]);
  }
}
