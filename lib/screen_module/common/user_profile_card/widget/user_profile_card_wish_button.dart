import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RejectCircleButton extends ConsumerWidget {
  final Function() onClick;

  const RejectCircleButton({super.key, required this.onClick});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colors.white.withOpacity(0.6)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: SizedBox(
          width: 50,
          height: 50,
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onClick(),
              child: const Icon(
                Icons.close,
                color: Color(0xff495057),
                size: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
