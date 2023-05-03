import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTapItem extends HookConsumerWidget {
  final String iconPath;
  final bool? isFocus;
  Function()? onRouting;

  BottomTapItem({
    required this.iconPath,
    this.isFocus,
    required this.onRouting,
  });
  // dfdf

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isFocus!
            ? Container(
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
              )
            : SizedBox(),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bound) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                isFocus! ? const Color(0xffBA00FF) : Colors.black,
                isFocus! ? const Color(0xff0031AA) : Colors.black,
              ],
            ).createShader(bound);
          },
          child: GestureDetector(
            onTap: () {
              onRouting!();
            },
            child: Image(
              width: 60,
              height: 45,
              image: AssetImage(iconPath),
            ),
          ),
        ),
      ],
    );
  }
}
