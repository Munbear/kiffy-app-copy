import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card.dart';
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
  int currentIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardSwiper(
        controller: controller,
        allowedSwipeDirection: const AllowedSwipeDirection.none(),
        isLoop: false,
        padding: EdgeInsets.zero,
        initialIndex: 0,
        onEnd: () {
          getUserProfiles();
        },
        numberOfCardsDisplayed: userProfiles.length <= 1 ? 1 : 2,
        cardsCount: userProfiles.length,
        cardBuilder: (context, index) {
          return UserProfileCard(
            userProfile: userProfiles[index],
            onWish: (userId) async {
              await ref
                  .read(openApiProvider)
                  .getWishApi()
                  .apiWishV1WishApprovePut(
                wishApproveRequest: WishApproveRequest(
                  (b) {
                    b.toUserId = userId;
                  },
                ),
              );
              controller.swipeBottom();
            },
            onReject: (userId) async {
              await ref
                  .read(openApiProvider)
                  .getWishApi()
                  .apiWishV1WishRejectPut(
                wishRejectRequest: WishRejectRequest(
                  (b) {
                    b.toUserId = userId;
                  },
                ),
              );
              controller.swipeBottom();
            },
          );
        },
      ),
    );
  }
}
