import 'package:Kiffy/domain/explore/widget/explore_wished_list_item.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_more.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreviewLikedList extends ConsumerStatefulWidget {
  const PreviewLikedList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PreviewLikedListState();
}

class _PreviewLikedListState extends ConsumerState<PreviewLikedList> {
  @override
  Widget build(BuildContext context) {
    final wishOtherProfiles = ref.watch(wishMeUsersProvider);

    return Stack(
      children: [
        SizedBox(
          height: 94,
          child: ListView(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            children: [
              if (wishOtherProfiles != null)
                ...wishOtherProfiles.list.map(
                  (wishOtherProfile) => ExploreWishedListItem(
                    profile: wishOtherProfile,
                  ),
                ),
              // 자세히 보기
              if (wishOtherProfiles != null)
                wishOtherProfiles.list.isNotEmpty ? const ExploreWishedListMore() : const Center(child: Text("아직 위시를 받은 적이 없습니다.")),
            ],
          ),
        ),

        // 유저 성별에 따라사 보여지는 텍스트가 달라짐 :: 업데이트
        // const LockBulr(mainText: "It's still being implemented.", subText: "It's still being implemented.")
      ],
    );
  }
}
