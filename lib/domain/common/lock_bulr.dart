import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LockBulr extends ConsumerWidget {
  final String mainText;
  final String subText;

  const LockBulr({super.key, required this.mainText, required this.subText});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 94,
      color: Colors.white.withOpacity(0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/images/lock_image.png"), width: 15, height: 20),
              const SizedBox(width: 9),
              Text(
                mainText,
                style: const TextStyle(
                  fontSize: 18,
                  color: Color(0xff0031AA),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subText,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
