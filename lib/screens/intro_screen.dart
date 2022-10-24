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
          child: Image(width: 100, height: 90, image: AssetImage("assets/images/logo.png")),
        ),
      ),
    );
  }
}
