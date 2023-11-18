import 'dart:ui';

import 'package:Kiffy/screen_module/sign/provider/auth_storage_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

final openApiProvider = StateProvider<Openapi>((ref) {
  String? baseUrl = FlavorConfig.instance.variables["apiUrl"];

  final Dio dio = Dio(
    BaseOptions(
      responseType: ResponseType.json,
      baseUrl: baseUrl!,
    ),
  );

  final Openapi openapi = Openapi(
    dio: dio,
    basePathOverride: baseUrl,
  );

  // 인터셉터
  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    String? accessToken = await AuthStorage.getAccessToken();

    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    // 국가 코드
    options.headers['Accept-Language'] = window.locale.countryCode;

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

  return openapi;
});
