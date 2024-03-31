import 'package:Kiffy/config/router/route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherWishPreviewChipMore extends ConsumerWidget {
  const OtherWishPreviewChipMore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => ref.read(routerProvider).pushNamed("likedListPage"),
          child: Container(
            width: 64,
            height: 64,
            clipBehavior: Clip.hardEdge,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                "assets/icons/arrow_right_icon.svg",
                color: const Color(0xFFB5B5B5),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(top: 5),
          child: Text(
            tr("text.wish.other_wishes.see_more"),
            style: const TextStyle(color: Color(0xFF6C6C6C)),
          ),
        )
      ],
    );
  }
}
