import 'package:Kiffy/screen_module/sign/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoogleSignInButton extends ConsumerWidget {
  final VoidCallback onPressed;

  const GoogleSignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(loginLoading);
    return ElevatedButton.icon(
      onPressed: () => onPressed(),
      label: const Text("Google"),
      icon: loading
          ? const SizedBox(
              width: 14,
              height: 14,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: Colors.purple,
              ),
            )
          : Image.asset("assets/images/google_logo.png", width: 20),
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
