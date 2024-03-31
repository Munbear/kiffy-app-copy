import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/skeleton/widget/skeleton.dart';
import 'package:Kiffy/screen_module/explore/widget/other_wish_preview_chip.dart';
import 'package:Kiffy/screen_module/explore/widget/other_wish_preview_chip_more.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class OtherWishPreviewChips extends StatelessWidget {
  final List<OtherWishUserProfileView> otherWishes;
  final Function(String) onTap;

  const OtherWishPreviewChips({
    super.key,
    required this.otherWishes,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      itemCount: otherWishes.length + 1,
      itemBuilder: (context, index) {
        // // 더보기 버튼
        if (index == otherWishes.length) {
          return const OtherWishPreviewChipMore();
        }
        final otherWish = otherWishes[index];

        return OtherWishPreviewChip(
          profile: otherWish.userProfile,
          onTap: () {
            onTap(otherWish.id);
          },
        );
      },
      separatorBuilder: (context, index) {
        return Gab.width12;
      },
    );
  }
}

class OtherWishPreviewChipsSkeleton extends StatelessWidget {
  const OtherWishPreviewChipsSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20),
      scrollDirection: Axis.horizontal,
      children: List.generate(
        5,
        (index) => Container(
          width: 60,
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: const Skeleton(),
        ),
      ),
    );
  }
}
