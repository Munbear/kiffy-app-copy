import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GuideTextBox extends HookConsumerWidget {
  final String? guideTitle;
  final String? guideSubTitle;

  GuideTextBox({super.key, this.guideTitle, this.guideSubTitle});

  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              guideTitle!,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              guideSubTitle!,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
