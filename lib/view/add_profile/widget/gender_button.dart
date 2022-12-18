import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GenderButton extends HookConsumerWidget {
  final String? value;
  final bool isCheckeed;
  const GenderButton({super.key, this.value, required this.isCheckeed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 140,
      height: 44,
      decoration: BoxDecoration(
        color: isCheckeed ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: isCheckeed ? const Color(0xff0031AA) : const Color(0xffbdbdbd), width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // icons svg 필요
          Icon(value == "laki" ? Icons.male : Icons.female),
          const SizedBox(width: 6),
          Text(
            value!,
            style: TextStyle(
              fontSize: 18,
              color: isCheckeed ? const Color(0xff0031AA) : const Color(0xffBDBDBD),
            ),
          ),
        ],
      ),
    );
  }
}
