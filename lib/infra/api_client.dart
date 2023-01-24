import 'dart:io';

import 'package:Kiffy/config/constants/contstants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class ApiClient {
  final dio = createDio();

  ApiClient._internal();
  static final _singleton = ApiClient._internal();

  factory ApiClient() => _singleton;

  static Dio createDio() {
    var dio = Dio(BaseOptions(
      baseUrl: Constants.API,
      receiveTimeout: 15000, // 15 seconds
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));
    final _storage = FlutterSecureStorage();

    dio.interceptors.addAll({
      ApiClientInterceptor(dio, _storage),
    });
    return dio;
  }
}

class ApiClientInterceptor extends Interceptor {
  final Dio dio;
  final FlutterSecureStorage _storage;

  ApiClientInterceptor(this.dio, this._storage);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? accessToken = await _storage.read(key: Constants.SECURE_STORAGE_AUTHTOEKN);
    if (accessToken != null) {
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${accessToken}';
    }

    return handler.next(options);
  }
}


