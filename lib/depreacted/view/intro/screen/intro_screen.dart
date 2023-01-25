// import 'package:Kiffy/view/sign/service/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/sign/provider/auth_provider.dart';

class IntroScreen extends HookConsumerWidget {
  static String get routeName => 'intro';

  static String get routeLocation => '/intro';

  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(authProvider.notifier).autoAuth();
    }, []);

    return Scaffold(
      body: Container(
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
        child: const Center(
          child: Image(width: 100, height: 90, image: AssetImage("assets/images/logo_white.png")),
        ),
      ),
    );
  }
}
