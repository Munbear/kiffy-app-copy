import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String iconPath;
  final bool isFocus;

  const CustomBottomNavBar({
    super.key,
    required this.iconPath,
    required this.isFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isFocus)
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
                isFocus ? const Color(0xffBA00FF) : Colors.black,
                isFocus ? const Color(0xff0031AA) : Colors.black,
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
