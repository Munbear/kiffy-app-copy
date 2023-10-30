import 'package:Kiffy/screen_module/common/widget/other_wish_user/other_wish_preview_chips.dart';
import 'package:Kiffy/screen_module/explore/provider/explore_users_provider.dart';
import 'package:Kiffy/screen_module/wish/provider/other_wish_users_reader.dart';
import 'package:Kiffy/screen_module/wish/provider/wish_remain_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class OtherWishPreviewSection extends ConsumerStatefulWidget {
  const OtherWishPreviewSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OtherWishPreviewSectionState();
}

class _OtherWishPreviewSectionState
    extends ConsumerState<OtherWishPreviewSection> {
  @override
  Widget build(BuildContext context) {
    final otherWishState = ref.watch(otherWishUsersReaderProvider);

    if (otherWishState.isLoading) {
      return const SizedBox(height: 95, child: OtherWishPreviewChipsSkeleton());
    }

    final List<OtherWishUserProfileView> remainedOtherWishUsers =
        otherWishState.requireValue.otherWishes.isNotEmpty
            ? otherWishState.requireValue.otherWishes
                .takeWhile((otherWish) => ref
                    .read(wishRemainCalculatorProvider)
                    .calculate(otherWish.createdAt)
                    .isRemained())
                .take(10)
                .toList()
            : [];

    return otherWishState.requireValue.otherWishes.isNotEmpty
        ? SizedBox(
            height: 95,
            child: OtherWishPreviewChips(
              otherWishes: remainedOtherWishUsers,
              onTap: (wishId) {
                context.push("/other-wish/wish/${wishId}/detail").then((value) {
                  ref.read(otherWishUsersReaderProvider.notifier).refresh();
                  ref.read(exploreUsersProvider.notifier).refresh();
                });
              },
            ),
          )
        : SizedBox(
            height: 95,
            child: Center(
              child: Text("아직 위시를 한 사용자가 없습니다"),
            ),
          );
  }
}
