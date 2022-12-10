import 'package:Kiffy/backend/api_client.dart';
import 'package:Kiffy/backend/auth_clinet.dart';
import 'package:Kiffy/backend/user_client.dart';
import 'package:Kiffy/config/constants/contstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';


final AuthProvider = StateNotifierProvider<AuthState, AuthToken>((ref) => AuthState());

class AuthState extends StateNotifier<AuthToken> {
  final storage = new FlutterSecureStorage();

  AuthState() : super(AuthToken());

  void auth() async {
    // 자동 로그인 검사 (이미 SecureStorage 에 액세스토큰이 저장되어있다면 그것을 사용함)
    String? savedAccessToken = await storage.read(key: Constants.SECURE_STORAGE_AUTHTOEKN);

    if (savedAccessToken != null) {
      try {
        final userStatus = await UserApi.getUserStatus();
        state.authStatus = AuthStatus.SUCCESS;
        state.userStatus = userStatus.status;
        return;
      } catch (e) {
        // ignore
      }
    }

    // 인증 흐름 트리거
    print('hello?');
    print('hi~~');
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print('bye');

    // 요청에서 인증 세부 정보 얻기
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final token = googleAuth?.accessToken;
    var response = await AuthApi.signIn(SignProvider.GOOGLE, token!);
    await storage.write(key: Constants.SECURE_STORAGE_AUTHTOEKN, value: response.accessToken);
    final userStatus = await UserApi.getUserStatus();
    state.authStatus = AuthStatus.SUCCESS;
    state.userStatus = userStatus.status;
  }
}

enum AuthStatus {
  SUCCESS,
  FAIL,
  NONE;
}

class AuthToken {
  AuthStatus authStatus = AuthStatus.NONE;
  UserStatus userStatus = UserStatus.JOINER;
}
