import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WishCircleButton extends ConsumerWidget {
  final Function() onClick;

  const WishCircleButton({
    super.key,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white, width: 2.0)),
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
