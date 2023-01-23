import 'dart:convert';

import 'package:Kiffy/backend/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final AuthClientProvider = Provider((ref) => AuthClient());

class AuthClient extends ApiBaseClient {
  Future<SignInResponse> signIn(SignProvider provider, String accessToken) async {
    final response = await post(Uri.parse("$baseUrl/product/api/view/sign/v1/in/${provider.toCode()}"),
        body: jsonEncode({"accessToken": accessToken}));

    return SignInResponse.fromJson(jsonDecode(response.body));
  }
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

class SignInResponse {
  late String accessToken;

  SignInResponse.fromJson(Map<String, dynamic> json) : accessToken = json["accessToken"];
}
