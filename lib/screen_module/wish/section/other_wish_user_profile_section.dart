import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/wish/section/other_wish_user_profile_chip_section.dart';
import 'package:Kiffy/screen_module/wish/widget/other_wish_user_profile_chip_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserProfileSection extends ConsumerStatefulWidget {
  const OtherWishUserProfileSection({super.key});

  @override
  ConsumerState<OtherWishUserProfileSection> createState() =>
      _OtherWishUserProfileSectionState();
}

class _OtherWishUserProfileSectionState
    extends ConsumerState<OtherWishUserProfileSection> {
  bool isLoading = true;
  bool hasNext = true;
  String? offsetWishId;
  List<OtherWishUserProfileView> otherWishes = List.empty(growable: true);

  void nextWishes() async {
    setState(() {
      isLoading = true;
    });
    if (hasNext) {
      var response =
          await ref.read(openApiProvider).getWishApi().apiWishV2WishOtherGet(
                offsetWishId: offsetWishId,
                limit: 20,
              );

      if (response.data != null && response.data!.list.isNotEmpty) {
        otherWishes.addAll(response.data!.list);
        offsetWishId = response.data!.list.lastOrNull?.id;
      }

      if (response.data!.paging.hasNext) {
        setState(() {
          hasNext = response.data!.paging.hasNext;
        });
      }
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      nextWishes();
    });
  }

  Widget OtherWishUserProfileSectionSkeleton() {
    return Container(
      padding: const EdgeInsets.all(30),
      color: Colors.white,
      child: Column(
        children: [
          ...[0, 1, 2, 3, 4].map(
            (e) => Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Row(
                children: [
                  OtherWishUserProfileChipSkeleton(),
                  Spacer(),
                  OtherWishUserProfileChipSkeleton(),
                  Spacer(),
                  OtherWishUserProfileChipSkeleton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget LoadingOtherWishUserProfiles() {
    if (isLoading) {
      return OtherWishUserProfileSectionSkeleton();
    }

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 0.8,
      shrinkWrap: true,
      children: [
        ...otherWishes.map(
          (otherWish) => Container(
            padding: EdgeInsets.all(10),
            child: OtherWishUserProfileChipSection(
              otherWish: otherWish,
              onRemainedProfileTap: () {
                context
                    .push("/other-wish/wish/${otherWish.id}/detail")
                    .then((value) {
                  setState(() {
                    otherWishes = List.empty(growable: true);
                    offsetWishId = null;
                    nextWishes();
                  });
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LoadingOtherWishUserProfiles();
  }
}
