import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PageControllerButton extends ConsumerWidget {
  final Function() prevButton;
  final Function() nextButton;

  const PageControllerButton({
    super.key,
    required this.prevButton,
    required this.nextButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: GestureDetector(
            child: Container(
              color: Colors.transparent,
            ),
            onTap: () => prevButton(),
          ),
        ),
        // 다음 사진으로
        Expanded(
          child: GestureDetector(
            child: Container(
              color: Colors.transparent,
            ),
            onTap: () => nextButton(),
          ),
        ),
      ],
    );
  }
}
