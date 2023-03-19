import 'dart:convert';

import 'package:Kiffy/infra/api_client.dart';

Future<SignInResponse> signIn(SignProvider provider, String accessToken) async {
  final response = await ApiClient().dio.post("/api/view/sign/v1/in/${provider.toCode()}", data: jsonEncode({"accessToken": accessToken}));

  return SignInResponse.fromJson(response.data);
}

class SignInResponse {
  late String accessToken;

  SignInResponse.fromJson(Map<String, dynamic> json) : accessToken = json["accessToken"];
}

enum SignProvider {
  GOOGLE,
  FACEBOOK;

  String toCode() {
    switch (this) {
      case SignProvider.GOOGLE:
        return "google";
      case SignProvider.FACEBOOK:
        return "facebook";
    }
  }
}
