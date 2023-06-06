import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MatchingMoreButton extends ConsumerWidget {
  final Function() onClick;

  const MatchingMoreButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(0.5),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(13),
          gradient: const LinearGradient(
            colors: [
              Color(0xffBA00FF),
              Color(0xff0031AA),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Material(
            color: Colors.white,
            child: InkWell(
              onTap: () => onClick(),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.transparent,
                ),
                child: ShaderMask(
                  shaderCallback: (Rect bound) {
                    return const LinearGradient(
                      colors: [Color(0xffBA00FF), Color(0xff0031AA)],
                      tileMode: TileMode.mirror,
                    ).createShader(bound);
                  },
                  child: const Text('More', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
