import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProcessGuideBox extends HookConsumerWidget {
  final content;
  ProcessGuideBox({super.key, required this.content});

  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              content.value.title,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              content.value.guideText,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
