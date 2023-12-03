import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavBAr extends ConsumerWidget {
  final String iconPath;

  const CustomBottomNavBAr({
    super.key,
    required this.iconPath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          width: 5,
          height: 5,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffBA00FF),
                Color(0xff0031AA),
              ],
            ),
          ),
        ),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bound) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xffBA00FF),
                Color(0xff0031AA),
                // widget.isFocus! ? const Color(0xffBA00FF) : Colors.black,
                // widget.isFocus! ? const Color(0xff0031AA) : Colors.black,
              ],
            ).createShader(bound);
          },
          child: Image(
            width: 60,
            height: 45,
            image: AssetImage(iconPath),
          ),
        )
      ],
    );
  }
}
