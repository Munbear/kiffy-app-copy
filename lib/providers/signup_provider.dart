import 'package:Kiffy/model/signup_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view_model/login_token.dart';

// test 용
final SignupProvider = StateNotifierProvider<SignUpState, SignUpModel>((ref) {
  return SignUpState();
});

class SignUpState extends StateNotifier<SignUpModel> {
  SignUpState() : super(SignUpModel());

  login() {}

  void googleLogin() async {
    // 인증 흐름 트리거
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // 요청에서 인증 세부 정보 얻기
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // 새 자격 증명 만들기
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // print(googleAuth?.accessToken);

    final token = googleAuth?.accessToken;
    print(token);

    if (token != null) {
      getUserToken(token);
    }

    //로그인하면 UserCredential 반환
    // UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
    // print(await result.user?.getIdToken());
  }
}
