import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuideTextBox extends HookConsumerWidget {
  final String? guideTitle;
  final String? guideSubTitle;

  const GuideTextBox({super.key, this.guideTitle, this.guideSubTitle});

  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              guideTitle!,
              style: const TextStyle(
                color: Color(0xff0031AA),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              guideSubTitle!,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xff6B6B6B),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
