import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../api/login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

void googleLogin() async {
  // 인증 흐름 트리거
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // 요청에서 인증 세부 정보 얻기
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // 1. 구글로그인 해서 accessToken받기
  // 2. Firebase에 등록
  // 3. API 서버에 요청해서 회원가입
  // 4. 다음페이지로 넘어가기

  // 새 자격 증명 만들기
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );
  // print(googleAuth?.accessToken);

  final token = googleAuth?.accessToken;
  print(token);

  if (token != null) {
    test(token);
  }

  //로그인하면 UserCredential 반환
  // UserCredential result = await FirebaseAuth.instance.signInWithCredential(credential);
  // print(await result.user?.getIdToken());
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: ElevatedButton(
              onPressed: googleLogin,
              child: Text("Login"),
            ),
          ),
        ],
      ),
    );
  }
}
