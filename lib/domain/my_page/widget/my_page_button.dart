import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyPageButton extends HookConsumerWidget {
  final String text;

  MyPageButton({super.key, required this.text});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Color(0xff0031AA)),
        color: Colors.white,
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black.withOpacity(0.14),
        //     blurRadius: 20,
        //     offset: Offset(0, 8),
        //   ),
        // ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
              color: Color(0xff0031AA),
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          SvgPicture.asset("assets/svg/arrow_more_grey.svg", color: Color(0xff0031AA)),
        ],
      ),
    );
  }
}
