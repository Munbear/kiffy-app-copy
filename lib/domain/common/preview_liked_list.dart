import 'package:Kiffy/domain/explore/widget/explore_wished_list_item.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_more.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreviewLikedList extends HookConsumerWidget {
  const PreviewLikedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        SizedBox(
          height: 94,
          child: ListView(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            children: [
              ExploreWishedListItem(),
              ExploreWishedListItem(),
              ExploreWishedListItem(),
              ExploreWishedListItem(),
              ExploreWishedListItem(),
              // 자세히 보기
              ExploreWishedListMore(),
            ],
          ),
        ),

        // 유저 성별에 따라사 보여지는 텍스트가 달라짐
        // const LockBulr(mainText: "It's still being implemented.", subText: "It's still being implemented.")
      ],
    );
  }
}
