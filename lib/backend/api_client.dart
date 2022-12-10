import 'dart:io';

import 'package:Kiffy/config/constants/contstants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiBaseClient extends http.BaseClient {
  late final http.Client client;
  late final FlutterSecureStorage _storage;
  late final String baseUrl;

  ApiBaseClient() {
    client = http.Client();
    _storage = const FlutterSecureStorage();
    baseUrl = Constants.API;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    String? accessToken = await _storage.read(key: Constants.SECURE_STORAGE_AUTHTOEKN);
    if (accessToken != null) {
        request.headers[HttpHeaders.authorizationHeader] = 'Bearer ${accessToken}';
    }
    request.headers[HttpHeaders.acceptHeader] = "application/json";
    request.headers[HttpHeaders.contentTypeHeader] = "application/json";

    return client.send(request);
  }
}