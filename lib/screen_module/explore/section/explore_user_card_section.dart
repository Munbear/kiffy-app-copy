import 'package:Kiffy/domain/common/user_profile_card.dart';
import 'package:Kiffy/infra/openapi_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class ExploreUserCardSection extends ConsumerStatefulWidget {
  const ExploreUserCardSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ExploreUserCardSectionState();
}

class _ExploreUserCardSectionState
    extends ConsumerState<ExploreUserCardSection> {
  final CardSwiperController controller = CardSwiperController();
  List<UserProfileView> userProfiles = List.empty();
  int wishCount = 0;
  int currentIndex = 0;

  void plusWishCount() {
    setState(() {
      wishCount += 1;
    });
  }

  void getUserProfiles() async {
    final response = await ref
        .read(openApiProvider)
        .getExploreApi()
        .apiExploreV1UsersGet(limit: 5, offset: 0);

    setState(() {
      userProfiles = response.data!.list!.toList();
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getUserProfiles();
    });
  }

  void prevImage(int currentIndex, PageController pageController) {
    if (currentIndex > 0) {
      currentIndex--;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void nextImage(
      int currentIndex, PageController pageController, int mediasLength) {
    if (currentIndex < mediasLength - 1) {
      currentIndex++;
      pageController.animateToPage(currentIndex,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardSwiper(
        controller: controller,
        isHorizontalSwipingEnabled: false,
        isVerticalSwipingEnabled: false,
        isLoop: false,
        padding: EdgeInsets.zero,
        initialIndex: 0,
        onEnd: () {
          if (wishCount >= 3) {
            getUserProfiles();
          }
        },
        numberOfCardsDisplayed: userProfiles.length <= 1 ? 1 : 2,
        cardsCount: userProfiles.length,
        cardBuilder: (context, index) {
          return UserProfileCard(
            userProfile: userProfiles[index],
            controller: controller,
            onWishApprove: (userId) {
              ref.read(openApiProvider).getWishApi().apiWishV1WishApprovePut(
                    wishApproveRequest:
                        WishApproveRequest((b) => b.toUserId = userId),
                  );
              plusWishCount();
              controller.swipeTop();
            },
            onWishReject: (userId) {
              ref.read(openApiProvider).getWishApi().apiWishV1WishRejectPut(
                  wishRejectRequest: WishRejectRequest((b) {
                b.toUserId = userId;
              }));
              plusWishCount();
              controller.swipeTop();
            },
          );
        },
      ),
    );
  }
}
