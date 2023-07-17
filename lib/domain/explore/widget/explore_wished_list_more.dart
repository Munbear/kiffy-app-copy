import 'package:Kiffy/config/router/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreWishedListMore extends ConsumerWidget {
  const ExploreWishedListMore({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => ref.read(routerProvider).pushNamed("likedListPage"),
            child: Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.14),
                  offset: const Offset(0, 0),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ]),
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
            child: const Text(
              "see more",
              style: TextStyle(color: Color(0xFF6C6C6C)),
            ),
          )
        ],
      ),
    );
  }
}
