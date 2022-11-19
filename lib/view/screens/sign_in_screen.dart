import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/sigin_button.dart';

// riverpod 용 StatefulWidget 으로 변경
class SignScreen extends ConsumerStatefulWidget {
  static String get routeName => 'sign';
  static String get routeLocation => '/sign';
  const SignScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignScreenState();
}

class _SignScreenState extends ConsumerState<SignScreen> {
  void onRouteLogin() => context.pushNamed("main");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(1.9, 0.1),
            colors: [
              Color(0xffBA00FF),
              Color(0xffB003FA),
              Color(0xff960AEE),
              Color(0xff6A15DB),
              Color(0xff2F25BF),
              Color(0xff0031AA),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(width: 100, height: 90, image: AssetImage("assets/images/logo.png")),
              const SizedBox(height: 92),
              // 버튼 위젯으로 감싸야됨
              SiginButton(text: "Sign in width Google", onRoute: onRouteLogin),
              const SizedBox(height: 25),
              // 버튼 위젯으로 감싸야됨ㅂ
              SiginButton(text: "Sign in width FaceBook", onRoute: onRouteLogin),
            ],
          ),
        ),
      ),
    );
  }
}
