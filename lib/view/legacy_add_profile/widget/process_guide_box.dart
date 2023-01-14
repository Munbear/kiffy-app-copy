import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProcessGuideBox extends HookConsumerWidget {
  final content;
  const ProcessGuideBox({super.key, required this.content});

  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              content.value.title,
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
              content.value.guideText,
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
