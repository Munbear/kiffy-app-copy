import 'package:Kiffy/screen_module/wish/provider/other_wish_users_reader.dart';
import 'package:Kiffy/screen_module/wish/section/other_wish_user_profile_chip_section.dart';
import 'package:Kiffy/screen_module/wish/widget/other_wish_user_profile_chip_skelton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtherWishUserProfileSection extends ConsumerStatefulWidget {
  const OtherWishUserProfileSection({super.key});

  @override
  ConsumerState<OtherWishUserProfileSection> createState() =>
      _OtherWishUserProfileSectionState();
}

class _OtherWishUserProfileSectionState
    extends ConsumerState<OtherWishUserProfileSection> {
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
    var otherWishState = ref.watch(otherWishUsersReaderProvider);

    if (otherWishState.isLoading) {
      return OtherWishUserProfileSectionSkeleton();
    }

    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 0.8,
      shrinkWrap: true,
      children: [
        ...otherWishState.requireValue.otherWishes.map(
          (otherWish) => Container(
            padding: EdgeInsets.all(10),
            child: OtherWishUserProfileChipSection(
              otherWish: otherWish,
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
