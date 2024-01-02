import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends ConsumerWidget {
  final String title;
  final Color titleColor;
  final double fontSize;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.titleColor,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const SizedBox(width: 20),
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => context.pop(),
          icon: SvgPicture.asset("assets/svg/arrow_back.svg"),
        ),
        const Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.w600,
            color: titleColor,
          ),
        ),
        const SizedBox(width: 32),
        const Spacer(),
      ],
    );
  }
}
