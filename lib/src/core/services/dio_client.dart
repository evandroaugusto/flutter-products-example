import 'package:app_referencia/src/core/environment/environment.dart';
import 'package:dio/dio.dart';

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
  }
}
