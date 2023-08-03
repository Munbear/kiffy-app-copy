import 'dart:convert';

import 'package:Kiffy/infra/api_client.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInResponse {
  late String accessToken;

  SignInResponse.fromJson(Map<String, dynamic> json) : accessToken = json["accessToken"];
}

final responseSignIn = Provider<ResponseSignIn>((ref) => ResponseSignIn(ref));

class ResponseSignIn {
  Ref ref;
  Dio dio;

  ResponseSignIn(this.ref) : dio = ref.read(dioProvider);

  Future<SignInResponse> signIn(SignProvider provider, String accessToken) async {
    final response = await dio.post("/api/view/sign/v1/in/${provider.toCode()}", data: jsonEncode({"accessToken": accessToken}));

    return SignInResponse.fromJson(response.data);
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
