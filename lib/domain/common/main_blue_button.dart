import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainBlueButton extends HookConsumerWidget {
  final String text;
  Function()? onClick;

  MainBlueButton({super.key, required this.text, required onClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () => onClick,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 15),
        backgroundColor: const Color(0xff0031aa),
      ),
      child: Text(text, style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}
