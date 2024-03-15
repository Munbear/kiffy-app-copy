import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainAppBar extends ConsumerWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset(
        width: 70,
        height: 55,
        "assets/images/kiffy_logo.png",
      ),
    );
  }
}
