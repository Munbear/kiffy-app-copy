import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen/wish/other_wish_user_detail_screen.dart';
import 'package:Kiffy/screen_module/explore/widget/other_wish_preview_chips.dart';
import 'package:Kiffy/screen_module/explore/provider/explore_users_provider.dart';
import 'package:Kiffy/screen_module/wish/provider/other_wish_users_reader.dart';
import 'package:Kiffy/screen_module/wish/provider/wish_remain_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class PreviewWishedMeSection extends ConsumerStatefulWidget {
  const PreviewWishedMeSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PreviewWishedMeSectionState();
}

class _PreviewWishedMeSectionState
    extends ConsumerState<PreviewWishedMeSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 95,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return null;
        },
        separatorBuilder: (context, index) {
          return Gab.width8;
        },
        itemCount: 10,
      ),
    );
  }
}

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

    if (otherWishState.isLoading) {
      return const SizedBox(height: 95, child: OtherWishPreviewChipsSkeleton());
    }

    return remainedOtherWishUsers.isNotEmpty
        ? SizedBox(
            height: 100,
            child: OtherWishPreviewChips(
              otherWishes: remainedOtherWishUsers,
              onTap: (wishId) {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return OtherWishUserDetailScreen(wishId: wishId);
                  },
                )).then(
                  (value) {
                    ref.read(otherWishUsersReaderProvider.notifier).refresh();
                    ref.read(exploreUsersProvider.notifier).refresh();
                  },
                );

                // context.pushNamed(OtherWishUserDetailScreen.routeName).then(
                //   (value) {
                //     ref.read(otherWishUsersReaderProvider.notifier).refresh();
                //     ref.read(exploreUsersProvider.notifier).refresh();
                //   },
                // );
                // context.push("/other-wish/wish/${wishId}/detail").then((value) {
                //   ref.read(otherWishUsersReaderProvider.notifier).refresh();
                //   ref.read(exploreUsersProvider.notifier).refresh();
                // });
              },
            ),
          )
        : const SizedBox();
  }
}
