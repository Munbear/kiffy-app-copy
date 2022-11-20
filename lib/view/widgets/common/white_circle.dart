import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WhiteCircleWidget extends ConsumerWidget {
  final String? imagePath;

  const WhiteCircleWidget({super.key, this.imagePath});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        print("hellow");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
            ),
          ],
        ),
        width: 50,
        height: 50,
        child: Center(
          child: Image(width: 25, height: 25, image: AssetImage(imagePath!)),
        ),
      ),
    );
  }
}
