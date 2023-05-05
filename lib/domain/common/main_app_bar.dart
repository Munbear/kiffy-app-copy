import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainAppBar extends ConsumerWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.5,
      title: Image.asset(
        width: 70,
        height: 55,
        "assets/images/kiffy_logo_purple.png",
      ),
    );
  }
}
