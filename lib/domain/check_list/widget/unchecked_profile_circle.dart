import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/border._style.dart';

class UncheckedProfileCircle extends HookConsumerWidget {
  const UncheckedProfileCircle({super.key});

  lockMessageFullScreenPopup(context) {
    return showDialog(
      barrierColor: Colors.white.withOpacity(0.7),
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  width: 14,
                  height: 19,
                  image: AssetImage("assets/images/lock_image.png"),
                ),
                SizedBox(width: 5),
                Text(
                  "Match with 10 opponents!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff0031AA),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              "That way, you can see the person who likes you.",
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        lockMessageFullScreenPopup(context);
      },
      child: Column(
        children: [
          Container(
            width: 93,
            height: 93,
            decoration: BorderGradientBorderRadius50.outlineGradientBoxDecoration,
            child: Container(
              padding: const EdgeInsets.all(4),
              width: 83,
              height: 83,
              decoration: BorderGradientBorderRadius50.innerDecoration,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/example_for_dev.png"),
                ),
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
      ),
    );
  }
}
