import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExploreWishedListItem extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.only(right: 13),
      child: Column(
        children: [
          Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment(1.9, 0.1),
                    colors: [
                      Color(0xffBA00FF),
                      Color(0xffB003FA),
                      Color(0xff960AEE),
                      Color(0xff6A15DB),
                      Color(0xff2F25BF),
                      Color(0xff0031AA),
                    ],
                  ),
                  width: 3),
            ),
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                "assets/images/example_for_dev.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 5),
            child: Text("kiffy"),
          )
        ],
      ),
    );
  }
}
