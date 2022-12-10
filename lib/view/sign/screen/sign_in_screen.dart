import 'package:Kiffy/view/service/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/white_circle.dart';

class SignScreen extends ConsumerStatefulWidget {
  static String get routeName => 'sign';

  static String get routeLocation => '/sign';

  const SignScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignScreenState();
}

class _SignScreenState extends ConsumerState<SignScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f6f6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(width: 72, height: 63, image: AssetImage("assets/images/logo_purple.png")),
          const SizedBox(height: 46),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 구분선
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 68, right: 20),
                  color: const Color(0xffD0D0D0),
                  height: 1,
                ),
              ),

              // 로그인 텍스트
              const Text(
                "LOG IN",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff0031AA),
                ),
              ),

              // 구분선
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 68),
                  height: 1,
                  color: const Color(0xffD0D0D0),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 페이스북 로그인 버튼
              InkWell(
                onTap: () {
                  // 페이스북 로그인 추가
                },
                child: const WhiteCircleWidget(imagePath: "assets/images/facebook_logo.png"),
              ),

              // 간경 조절
              const SizedBox(width: 38),

              // 구글 로그인 버튼
              InkWell(
                onTap: () => ref.read(authProvider.notifier).auth(),
                child: const WhiteCircleWidget(imagePath: "assets/images/google_logo.png"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
