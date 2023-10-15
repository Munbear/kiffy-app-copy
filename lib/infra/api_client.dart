import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final dioProvider = StateProvider<Dio>((ref) {
  String? baseUrl = FlavorConfig.instance.variables["apiUrl"];

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl!,
      responseType: ResponseType.json,
    ),
  );

  // 인터셉터
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    final storage = const FlutterSecureStorage();

    String? accessToken = await storage.read(key: "accessToken");

    if (storage != null)
      options.headers['authorization'] = 'Bearer $accessToken';

    // 국가 코드
    options.headers['x-kiffy-country-code'] = window.locale.countryCode;

    return handler.next(options);
  }, onResponse: (response, handler) {
    print(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return handler.next(response);
  }, onError: (DioError err, handler) {
    print(err.message);
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions}');
    return handler.next(err);
  }));

  return dio;
});
