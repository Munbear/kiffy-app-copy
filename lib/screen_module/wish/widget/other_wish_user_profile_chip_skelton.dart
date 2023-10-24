import 'package:Kiffy/screen_module/common/widget/skeleton.dart';
import 'package:flutter/material.dart';

class OtherWishUserProfileChipSkeleton extends StatelessWidget {
  const OtherWishUserProfileChipSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(shape: BoxShape.circle),
      child: Skeleton(),
    );
  }
}
