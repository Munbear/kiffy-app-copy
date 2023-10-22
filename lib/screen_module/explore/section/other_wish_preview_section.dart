import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/explore/widget/explore_wished_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class OtherWishPreviewSection extends ConsumerStatefulWidget {
  const OtherWishPreviewSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtherWishPreviewSectionState();
}

class _OtherWishPreviewSectionState
    extends ConsumerState<OtherWishPreviewSection> {
  List<UserProfileView> wishOtherProfiles = List.empty();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var response =
          await ref.read(openApiProvider).getWishApi().apiWishV1WishOtherGet();
      setState(() {
        wishOtherProfiles = response.data!.list!.toList();
      });
    });
  }

  //  ref
  //           .read(mediaDetailProvider.notifier)
  //           .update((state) => state = widget.profile.medias.toList());

  // ref.read(routerProvider).pushNamed(
  //   UnMatchUserProfile.routeName,
  //   queryParams: {
  //     "userName": widget.profile.name,
  //     "userAge": widget.profile.birthDate,
  //     "userId": widget.profile.id,
  //     "userIntro": widget.profile.intro,
  //   },
  // );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 95,
          child: ListView(
            padding: const EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,
            children: [
              ...wishOtherProfiles.map(
                (wishOtherProfile) => OtherWishPreviewChip(
                  profile: wishOtherProfile,
                  onTap: () {
                    // 상세 화면 넘어기
                  },
                ),
              ),
              // 자세히 보기
              if (wishOtherProfiles.isEmpty)
                const Center(child: Text("아직 위시를 받은 적이 없습니다."))

              // 위시 받은 유저 리스트
              // wishOtherProfiles.list.isNotEmpty ? const ExploreWishedListMore() : const Center(child: Text("아직 위시를 받은 적이 없습니다.")),
            ],
          ),
        ),

        // TODO 유저 성별에 따라사 보여지는 텍스트가 달라짐 :: 업데이트
        // const LockBulr(mainText: "It's still being implemented.", subText: "It's still being implemented.")
      ],
    );
  }
}
