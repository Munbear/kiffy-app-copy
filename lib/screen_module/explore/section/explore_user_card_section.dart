import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/widget/skeleton.dart';
import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card.dart';
import 'package:Kiffy/screen_module/explore/widget/explore_user_card_empty.dart';
import 'package:Kiffy/screen_module/wish/provider/wish_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ExploreUserProfileCardSection extends ConsumerStatefulWidget {
  const ExploreUserProfileCardSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExploreUserCardSectionState();
}

class _ExploreUserCardSectionState
    extends ConsumerState<ExploreUserProfileCardSection> {
  final CardSwiperController controller = CardSwiperController();
  List<UserProfileView> userProfiles = List.empty();
  bool isLoading = true;

  void fillUserProfiles() async {
    setState(() {
      isLoading = true;
    });
    final response = await ref
        .read(openApiProvider)
        .getExploreApi()
        .apiExploreV1UsersGet(offset: 0, limit: 5);

    setState(() {
      userProfiles = response.data!.list!.toList();
      isLoading = false;
    });
  }

  /// 위시 및 스와이프
  void wishAndSwipe(String userId) async {
    await ref.read(wishManagerProvider).approve(userId);
    controller.swipeRight();
  }

  /// 거절 및 스와이프
  void rejectAndSwipe(String userId) async {
    await ref.read(wishManagerProvider).reject(userId);
    controller.swipeLeft();
  }

  /// 로딩 위젯
  Widget LoadingCardSwiper() {
    if (isLoading) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Skeleton(),
      );
    }

    // 유저 없을 때
    if (userProfiles.isEmpty) {
      return const ExploreUserCardEmpty();
    }

    return CardSwiper(
      controller: controller,
      allowedSwipeDirection: const AllowedSwipeDirection.none(),
      isLoop: false,
      padding: EdgeInsets.zero,
      initialIndex: 0,
      onEnd: () {
        fillUserProfiles();
      },
      numberOfCardsDisplayed: userProfiles.length <= 1 ? 1 : 2,
      cardsCount: userProfiles.length,
      cardBuilder: (context, index) {
        return UserProfileCard(
          userProfile: userProfiles[index],
          onWish: (userId) => wishAndSwipe(userId),
          onReject: (userId) => rejectAndSwipe(userId),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fillUserProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
          bottom: 40,
        ),
        child: LoadingCardSwiper(),
      ),
    );
  }
}
