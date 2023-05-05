import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTapItem extends ConsumerStatefulWidget {
  final String iconPath;
  final bool? isFocus;
  Function()? onRouting;

  BottomTapItem({
    super.key,
    required this.iconPath,
    this.isFocus,
    required this.onRouting,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomTapItemState();
}

class _BottomTapItemState extends ConsumerState<BottomTapItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        widget.isFocus!
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
            : const SizedBox(),
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (Rect bound) {
            return LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                widget.isFocus! ? const Color(0xffBA00FF) : Colors.black,
                widget.isFocus! ? const Color(0xff0031AA) : Colors.black,
              ],
            ).createShader(bound);
          },
          child: GestureDetector(
            onTap: () {
              widget.onRouting!();
            },
            child: Image(
              width: 60,
              height: 45,
              image: AssetImage(widget.iconPath),
            ),
          ),
        ),
      ],
    );
  }
}
