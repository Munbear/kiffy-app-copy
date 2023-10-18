import 'dart:convert';

import 'package:Kiffy/infra/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

  SignInResponse.fromJson(Map<String, dynamic> json)
      : accessToken = json["accessToken"];
}

final responseSignIn = Provider<ResponseSignIn>((ref) => ResponseSignIn(ref));

class ResponseSignIn {
  Ref ref;
  Dio dio;

  ResponseSignIn(this.ref) : dio = ref.read(dioProvider);

  signIn(SignProvider provider, String accessToken) async {
    final response = await dio.post("/api/sign/v1/in/${provider.toCode()}",
        data: jsonEncode({"accessToken": accessToken}));

    print(response.data);

    final item = SignInResponse.fromJson(response.data);

    ref.read(signInResponseProvider.notifier).update((state) => state = item);
  }
}

final signInResponseProvider = StateProvider<SignInResponse?>((ref) => null);
