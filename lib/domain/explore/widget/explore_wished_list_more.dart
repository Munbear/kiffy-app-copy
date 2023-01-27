import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreWishedListMore extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(right: 0),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.7),
                offset: Offset(0, 0),
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
              padding: EdgeInsets.all(16),
              child: SvgPicture.asset(
                "assets/icons/arrow_right_icon.svg",
                color: Color(0xFFB5B5B5),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              "see more",
              style: TextStyle(color: Color(0xFF6C6C6C)),
            ),
          )
        ],
      ),
    );
  }
}
