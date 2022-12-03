import 'dart:convert';

import 'package:http/http.dart' as http;

final KiffyApi = ApiClient();

class ApiClient extends http.BaseClient {
  final http.Client _client = http.Client();
  String? _accessToken;

  void setAccessToken(String accessToken) {
    _accessToken = accessToken;
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_accessToken != null) {
      request.headers['Authorization'] = 'Bearer ${_accessToken}';
    }
    return _client.send(request);
  }

  Future<SignInResponse> signIn(SignProvider provider, String accessToken) async {
    final response = await _client.post(Uri.http("host"), body: {"accessToken": accessToken});

    return SignInResponse.fromJson(jsonDecode(response.body));
  }

  Future<UserStatusResponse> getUserStatus() async {
    final response = await _client.get(Uri.http("api-dev.kiffy.club/product/api/view/user/v1/me/status"));
    return UserStatusResponse.fromJson(jsonDecode(response.body));
  }
}

enum SignProvider {
  GOOGLE,
  APPLE;
}

class SignInResponse {
  late String accessToken;

  SignInResponse.fromJson(Map<String, dynamic> json) : accessToken = json["accessToken"];
}

enum UserStatus {
  JOINER,
  APPROVED;

  static UserStatus fromString(String status) {
    switch (status) {
      case "JOINER":
        return UserStatus.JOINER;
      case "APPROVED":
        return UserStatus.APPROVED;
      default:
        return UserStatus.JOINER;
    }
  }
}

class UserStatusResponse {
  late String id;
  late UserStatus status;

  UserStatusResponse.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        status = UserStatus.fromString(json["status"]);
}
