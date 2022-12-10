import 'dart:async';

import 'package:Kiffy/view/service/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroScreen extends ConsumerStatefulWidget {
  static String get routeName => 'intro';
  static String get routeLocation => '/intro';
  const IntroScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IntroScreenState();
}

class _IntroScreenState extends ConsumerState<IntroScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    ref.read(authProvider.notifier).autoAuth();
  }

  @override
  Widget build(BuildContext context) {
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
