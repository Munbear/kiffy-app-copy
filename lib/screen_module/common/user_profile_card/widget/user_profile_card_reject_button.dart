import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WishCircleButton extends ConsumerWidget {
  final Function() onClick;

  const WishCircleButton({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2.0),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xffBA00FF),
            Color(0xff0031AA),
          ],
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onClick(),
              child: Container(
                margin: const EdgeInsets.only(top: 13),
                child: Image.asset("assets/icons/heart_icon.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
