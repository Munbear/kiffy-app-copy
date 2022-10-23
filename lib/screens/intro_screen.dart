import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    Timer(const Duration(seconds: 3), () => context.replace('/sign'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/background.png"), fit: BoxFit.cover),
        ),
        child: const Center(
          child: Image(width: 100, height: 90, image: AssetImage("assets/images/logo.png")),
        ),
      ),
    );
  }
}
