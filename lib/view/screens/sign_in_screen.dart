import 'package:Kiffy/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/common/white_circle.dart';
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
      backgroundColor: Color(0xfff6f6f6),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: 72,
            height: 63,
            image: AssetImage("assets/images/logo_purple.png"),
          ),
          const SizedBox(height: 46),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Divider(
              //   color: Colors.red,
              // ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 68, right: 20),
                  color: const Color(0xffD0D0D0),
                  height: 1,
                ),
              ),
              const Text(
                "LOG IN",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Color(0xff0031AA),
                ),
              ),
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
              WhiteCircleWidget(imagePath: "assets/images/facebook_logo.png"),
              SizedBox(width: 38),
              ElevatedButton(
                  onPressed: () => ref.read(AuthProvider.notifier).auth(),
                  child: WhiteCircleWidget(imagePath: "assets/images/google_logo.png"))
            ],
          ),
        ],
      ),
    );
  }
}
