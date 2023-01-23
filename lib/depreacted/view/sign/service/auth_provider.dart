import 'package:Kiffy/backend/auth_clinet.dart';
import 'package:Kiffy/backend/user_client.dart';
import 'package:Kiffy/config/constants/contstants.dart';
import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/view/legacy_add_profile/screen/legacy_add_profile.dart';
import 'package:Kiffy/view/home/screen/home_screen.dart';
import 'package:Kiffy/view/sign/screen/sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authProvider = StateNotifierProvider<AuthState, AuthToken>((ref) => AuthState(ref));

class AuthState extends StateNotifier<AuthToken> {
  final storage = new FlutterSecureStorage();
  final Ref ref;

  AuthState(this.ref) : super(AuthToken());

  void _routeByAuthToken(AuthToken token) {
    if (token.userStatus == UserStatus.JOINER && token.authStatus == AuthStatus.SUCCESS) {
      ref.read(routerProvider).replace(LegacyAddProfile.routeLocation);
    }

    if (token.userStatus == UserStatus.APPROVED && token.authStatus == AuthStatus.SUCCESS) {
      ref.read(routerProvider).replace(HomeScreen.routeLocation);
    }

    if (token.authStatus == AuthStatus.NONE || token.authStatus == AuthStatus.FAIL) {
      ref.read(routerProvider).replace(SignScreen.routeLocation);
    }
  }

  void autoAuth() async {
    // 자동 로그인 검사 (이미 SecureStorage 에 액세스토큰이 저장되어있다면 그것을 사용함)
    String? savedAccessToken = await storage.read(key: Constants.SECURE_STORAGE_AUTHTOEKN);

    if (savedAccessToken != null) {
      try {
        final userStatus = await ref.read(UserClientProvider).getUserStatus();
        state.authStatus = AuthStatus.SUCCESS;
        state.userStatus = userStatus.status;
        _routeByAuthToken(state);
        return;
      } catch (e) {
        _routeByAuthToken(state);
      }
    }
    _routeByAuthToken(state);
  }

  void auth() async {
    // 인증 흐름 트리거
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // 요청에서 인증 세부 정보 얻기
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    final token = googleAuth?.accessToken;
    var response = await ref.read(AuthClientProvider).signIn(SignProvider.GOOGLE, token!);
    await storage.write(key: Constants.SECURE_STORAGE_AUTHTOEKN, value: response.accessToken);
    final userStatus = await ref.read(UserClientProvider).getUserStatus();
    state.authStatus = AuthStatus.SUCCESS;
    state.userStatus = userStatus.status;
    _routeByAuthToken(state);
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
