import 'package:Kiffy/config/constants/contstants.dart';
import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/core/enum/user_status.dart';
import 'package:Kiffy/domain/my_page/provider/user_profile_info.dart';
import 'package:Kiffy/infra/auth_client.dart';
import 'package:Kiffy/infra/user_client.dart';
import 'package:Kiffy/infra/user_info.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../page/sign_page.dart';

enum AuthStatus {
  SUCCESS,
  FAIL,
  NONE;
}

class AuthToken {
  AuthStatus authStatus = AuthStatus.NONE;
  UserStatus userStatus = UserStatus.JOINER;
}

final authProvider = StateNotifierProvider<AuthState, AuthToken>((ref) => AuthState(ref));

class AuthState extends StateNotifier<AuthToken> {
  final storage = const FlutterSecureStorage();
  final Ref ref;

  AuthState(this.ref) : super(AuthToken());

  void _routeByAuthToken(AuthToken token) {
    // 신규 회원이면 프로필 등록 화면으로
    if (token.userStatus == UserStatus.JOINER && token.authStatus == AuthStatus.SUCCESS) {
      ref.read(routerProvider).replace("/profile/add_profile/user");
    }

    // 회원 가입한 회원이면 탐색 텝으로 보내기
    if (token.userStatus == UserStatus.APPROVED && token.authStatus == AuthStatus.SUCCESS) {
      ref.read(routerProvider).replace("/explore");
    }

    // 실패시 다시 돌리
    if (token.authStatus == AuthStatus.NONE || token.authStatus == AuthStatus.FAIL) {
      ref.read(routerProvider).replace("/sign");
    }
  }

  void autoAuth() async {
    // 자동 로그인 검사 (이미 SecureStorage 에 액세스토큰이 저장되어있다면 그것을 사용함)
    String? savedAccessToken = await storage.read(key: Constants.SECURE_STORAGE_AUTHTOEKN);
    print(savedAccessToken);

    if (savedAccessToken != null) {
      try {
        final userStatus = ref.read(userStatusResponse).getUserStatus(); // await getUserStatus();
        state.authStatus = AuthStatus.SUCCESS;
        state.userStatus = userStatus.status;
        FirebaseAuth.instance.signInWithEmailAndPassword(email: userStatus.email, password: savedAccessToken);
        _routeByAuthToken(state);
        ref.read(userInfoProvider).getMyProfile();
        return;
      } catch (e) {
        _routeByAuthToken(state);
      }
    }
    _routeByAuthToken(state);
  }

  logout() async {
    await storage.delete(key: Constants.SECURE_STORAGE_AUTHTOEKN);

    try {
      await GoogleSignIn().signOut();
    } catch (e) {
      print(e);
    }

    ref.read(routerProvider).replace(SignPage.routeLoaction);
    print("출력 출력 출력");
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

    var userCredentials = await FirebaseAuth.instance.signInWithCredential(credential);

    final token = googleAuth?.accessToken;
    var response = await signIn(SignProvider.GOOGLE, token!);
    await storage.write(key: Constants.SECURE_STORAGE_AUTHTOEKN, value: response.accessToken);
    final userStatus = await getUserStatus();
    await userCredentials.user?.updatePassword(response.accessToken);
    state.authStatus = AuthStatus.SUCCESS;
    state.userStatus = userStatus.status;
    _routeByAuthToken(state);
  }
}
