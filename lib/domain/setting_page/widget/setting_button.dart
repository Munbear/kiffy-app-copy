import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingButton extends HookConsumerWidget {
  final String IconPath;
  final String text;

  SettingButton({required this.IconPath, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              width: 22,
              height: 22,
              image: AssetImage(IconPath),
            ),
            const SizedBox(width: 14),
            Text(text),
          ],
        ),
        SvgPicture.asset(
          "assets/svg/arrow_more_grey.svg",
          width: 14,
          height: 14,
          color: Colors.black,
        ),
      ],
    );
  }
}
