import 'package:Kiffy/screen_module/common/skeleton/widget/skeleton.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card.dart';
import 'package:Kiffy/screen_module/explore/provider/explore_users_provider.dart';
import 'package:Kiffy/screen_module/explore/widget/explore_user_card_empty.dart';
import 'package:Kiffy/screen_module/wish/provider/other_wish_users_reader.dart';
import 'package:Kiffy/screen_module/wish/provider/wish_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExploreUserProfileCardSection extends ConsumerStatefulWidget {
  const ExploreUserProfileCardSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExploreUserCardSectionState();
}

class _ExploreUserCardSectionState
    extends ConsumerState<ExploreUserProfileCardSection> {
  final CardSwiperController controller = CardSwiperController();

  /// 위시 및 스와이프
  void wishAndSwipe(String userId) async {
    await ref.read(wishManagerProvider).approve(userId);
    await ref.read(otherWishUsersReaderProvider.notifier).removeUser(userId);
    controller.swipeRight();
  }

  /// 거절 및 스와이프
  void rejectAndSwipe(String userId) async {
    await ref.read(wishManagerProvider).reject(userId);
    await ref.read(otherWishUsersReaderProvider.notifier).removeUser(userId);
    controller.swipeLeft();
  }

  @override
  Widget build(BuildContext context) {
    var exploreUsers = ref.watch(exploreUsersProvider);

    if (exploreUsers.isLoading ||
        exploreUsers.isRefreshing ||
        exploreUsers.isReloading) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Skeleton(),
          ),
        ),
      );
    }

    if (exploreUsers.requireValue.userProfiles.isEmpty) {
      return Expanded(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
          child: const ExploreUserCardEmpty(),
        ),
      );
    }

    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: CardSwiper(
          controller: controller,
          allowedSwipeDirection: const AllowedSwipeDirection.none(),
          isLoop: false,
          padding: EdgeInsets.zero,
          initialIndex: 0,
          onEnd: () {
            ref.read(exploreUsersProvider.notifier).refresh();
          },
          numberOfCardsDisplayed:
              exploreUsers.requireValue.userProfiles.length <= 1 ? 1 : 2,
          cardsCount: exploreUsers.requireValue.userProfiles.length,
          cardBuilder: (context, index) {
            return UserProfileCard(
              userProfile: exploreUsers.requireValue.userProfiles[index],
              onWish: (userId) => wishAndSwipe(userId),
              onReject: (userId) => rejectAndSwipe(userId),
            );
          },
        ),
      ),
    );
  }
}
