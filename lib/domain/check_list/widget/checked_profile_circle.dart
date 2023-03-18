import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/border._style.dart';

class CheckedProfileCircle extends HookConsumerWidget {
  const CheckedProfileCircle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          width: 83,
          height: 83,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/example_for_dev.png"),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "user",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "34:23:12",
          style: TextStyle(
            color: Color(0xff0031AA),
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
