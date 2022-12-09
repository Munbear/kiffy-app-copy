import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SiginButton extends ConsumerWidget {
  const SiginButton({super.key, required this.text, required this.onRoute});

  final String text;
  final Function onRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 구글. 페이스북, 애플 로고 작업?
    return InkWell(
      onTap: () => {},
      child: Container(
        height: 57,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(30)),
          border: Border.all(color: Colors.white, width: 1),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
