import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomAppBarImageTitle extends ConsumerWidget {
  const CustomAppBarImageTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(width: 20),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset("assets/svg/arrow_back.svg"),
        ),
        const Spacer(),
        Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
        const SizedBox(width: 32),
        const Spacer(),
      ],
    );
  }
}
