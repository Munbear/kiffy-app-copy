import 'package:Kiffy/backend/api_client.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

// final storage = new FlutterSecureStorage();

final AuthProvider = StateNotifierProvider<AuthState, AuthToken>((ref) => AuthState());

class AuthState extends StateNotifier<AuthToken> {
  final String _AuthStateAccessTokenStorageKey = "kiffy:accessToken";

  AuthState() : super(AuthToken());

  void auth() async {
    // 자동 로그인 검사 (이미 SecureStorage 에 액세스토큰이 저장되어있다면 그것을 사용함)
    // String? savedAccessToken = await storage.read(key: _AuthStateAccessTokenStorageKey);

    // if (savedAccessToken != null) {
    //   KiffyApi.setAccessToken(savedAccessToken);
    //
    //   try {
    //     final userStatus = await KiffyApi.getUserStatus();
    //
    //     state.status = AuthStatus.SUCCESS;
    //     state.accessToken = savedAccessToken;
    //   } catch (e) {
    //     // ignore
    //   }
    // }

    // 인증 흐름 트리거
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // 요청에서 인증 세부 정보 얻기
    print("hello");
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final token = googleAuth?.accessToken;
    print(token);
  }
}

enum AuthStatus {
  SUCCESS,
  FAIL,
  NONE;
}

class AuthToken {
  AuthStatus status = AuthStatus.NONE;
  String? accessToken;
}
