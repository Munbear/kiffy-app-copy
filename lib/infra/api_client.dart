import 'dart:io';

import 'package:Kiffy/config/constants/contstants.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../env/env.dart';

// class ApiClient {
//   final dio = createDio();

//   ApiClient._internal();
//   static final _singleton = ApiClient._internal();

//   factory ApiClient() => _singleton;

//   static Dio createDio() {
//     var dio = Dio(BaseOptions(
//       baseUrl: Constants.API,
//       receiveTimeout: Duration(seconds: 15), // 15 seconds
//       connectTimeout: Duration(seconds: 15),
//       sendTimeout: Duration(seconds: 15),
//     ));
//     final _storage = FlutterSecureStorage();

//     dio.interceptors.addAll({
//       ApiClientInterceptor(dio, _storage),
//     });
//     return dio;
//   }
// }

// class ApiClientInterceptor extends Interceptor {
//   final Dio dio;
//   final FlutterSecureStorage _storage;

//   ApiClientInterceptor(this.dio, this._storage);

//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     String? accessToken = await _storage.read(key: Constants.SECURE_STORAGE_AUTHTOEKN);
//     if (accessToken != null) {
//       options.headers[HttpHeaders.authorizationHeader] = 'Bearer ${accessToken}';
//     }

//     return handler.next(options);
//   }
// }

////////////////////
final dioProvider = StateProvider<Dio>((ref) {
  String? baseUrl = Env.apiUrl;

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

    if (storage != null) options.headers['authorization'] = 'Bearer $accessToken';

    // 국가 코드
    // options.headers['x-kokiri-country-code'] = window.locale.countryCode;

    return handler.next(options);
  }, onResponse: (response, handler) {
    print('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    return handler.next(response);
  }, onError: (DioError err, handler) {
    print(err.message);
    print('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions}');
    return handler.next(err);
  }));

  return dio;
});
