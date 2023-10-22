import 'package:Kiffy/screen_module/common/widget/skeleton.dart';
import 'package:Kiffy/screen_module/explore/widget/other_wish_preview_chip.dart';
import 'package:Kiffy/screen_module/explore/widget/other_wish_preview_chip_more.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class OtherWishPreviewChips extends StatelessWidget {
  final List<UserProfileView> userProfiles;
  final Function(String) onTap;

  const OtherWishPreviewChips(
      {super.key, required this.userProfiles, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      children: [
        ...userProfiles.map(
          (userProfile) => OtherWishPreviewChip(
            profile: userProfile,
            onTap: () {
              onTap(userProfile.id);
            },
          ),
        ),
        ...userProfiles.isNotEmpty ? [const OtherWishPreviewChipMore()] : [],
      ],
    );
  }
}

class OtherWishPreviewChipsSkeleton extends StatelessWidget {
  Widget OtherWishPreviewChipSkeleton() {
    return Container(
      width: 60,
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
      child: Skeleton(),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      children: [
        OtherWishPreviewChipSkeleton(),
        OtherWishPreviewChipSkeleton(),
        OtherWishPreviewChipSkeleton(),
        OtherWishPreviewChipSkeleton(),
        OtherWishPreviewChipSkeleton(),
        OtherWishPreviewChipSkeleton(),
      ],
    );
  }
}
