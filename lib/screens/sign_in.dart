import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/sigin_button.dart';

// riverpod 용 StatefulWidget 으로 변경
class SignScreen extends ConsumerStatefulWidget {
  const SignScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignScreenState();
}

class _SignScreenState extends ConsumerState<SignScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(width: 100, height: 90, image: AssetImage("assets/images/logo.png")),
              SizedBox(height: 92),
              // 버튼 위젯으로 감싸야됨
              SiginButton(text: "Sign in width Google"),
              SizedBox(height: 25),
              // 버튼 위젯으로 감싸야됨ㅂ
              SiginButton(text: "Sign in width FaceBook"),
            ],
          ),
        ),
      ),
    );
  }
}
