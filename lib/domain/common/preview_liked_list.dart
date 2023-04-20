import 'package:Kiffy/domain/explore/widget/explore_wished_list_item.dart';
import 'package:Kiffy/domain/explore/widget/explore_wished_list_more.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:Kiffy/model/user_profile_view/user_profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PreviewLikedList extends HookConsumerWidget {
  const PreviewLikedList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishOtherProfiles = useState<List<UserProfileView>>([]);
    final hasNext = useState<bool>(true);
    final next = useState<String?>(null);

    final getApiAndSetState = () async {
      final otherProfiles = await getWishOthersProfiles();
      wishOtherProfiles.value = [...wishOtherProfiles.value, ...otherProfiles.list];
      hasNext.value = otherProfiles.paging.next != null;
      next.value = otherProfiles.paging.next;
    };

    useEffect(() {
      getApiAndSetState().then((value) {
        print("wishOtherProfiles = ${wishOtherProfiles.value}");
      });
    }, []);

    return Stack(
      children: [
        SizedBox(
          height: 94,
          child: ListView(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            children: [
              ...wishOtherProfiles.value.map((wishOtherProfile) => ExploreWishedListItem(profile: wishOtherProfile,)),
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
