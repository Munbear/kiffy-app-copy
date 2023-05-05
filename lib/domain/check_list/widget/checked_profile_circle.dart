import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/border._style.dart';

class CheckedProfileCircle extends ConsumerStatefulWidget {
  const CheckedProfileCircle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CheckedProfileCircleState();
}

class _CheckedProfileCircleState extends ConsumerState<CheckedProfileCircle> {
  @override
  Widget build(BuildContext context) {
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
