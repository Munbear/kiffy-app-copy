// import 'package:Kiffy/global/layout/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageScreen extends HookConsumerWidget {
  const MyPageScreen({super.key});

  static String get routeName => 'mypage';

  static String get routeLocation => '/mypage';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        children: [Text("Hello, MyPage")],
      ),
    );
  }
}
