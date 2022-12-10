import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GenderButton extends ConsumerWidget {
  final String? value;
  final bool isChecked;
  const GenderButton({super.key, this.value, required this.isChecked});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 11),
      height: 44,
      width: 140,
      decoration: BoxDecoration(
        color: isChecked ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(7),
        border: Border.all(color: isChecked ? const Color(0xff0031AA) : const Color(0xffbdbdbd), width: 1.5),
      ),
      child: Center(
        child: Text(
          value!,
          style: TextStyle(
            fontSize: 18,
            color: isChecked ? const Color(0xff0031AA) : const Color(0xffBDBDBD),
          ),
        ),
      ),
    );
  }
}
