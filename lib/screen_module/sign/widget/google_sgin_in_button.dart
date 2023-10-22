import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoogleSignInButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      label: const Text("Continue with Google"),
      icon: Image.asset("assets/images/google_logo.png", width: 20),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        shadowColor: const Color(0x00000000),
        padding:
            const EdgeInsets.only(top: 11, bottom: 11, right: 50, left: 50),
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xff494949),
        textStyle: const TextStyle(fontSize: 16),
        side: const BorderSide(
          color: Color(0xffDCDCDC),
        ),
      ),
    );
  }
}
