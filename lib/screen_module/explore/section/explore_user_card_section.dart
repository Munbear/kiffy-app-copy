import 'package:Kiffy/infra/openapi_client.dart';
import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';
import 'package:shimmer/shimmer.dart';

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
  bool isLoading = true;

  void fillUserProfiles() async {
    setState(() {
      isLoading = true;
    });
    final response = await ref
        .read(openApiProvider)
        .getExploreApi()
        .apiExploreV1UsersGet(limit: 5, offset: 0);

    setState(() {
      userProfiles = response.data!.list!.toList();
      isLoading = false;
    });
  }

  void wishAndSwipe(String userId) async {
    await ref.read(openApiProvider).getWishApi().apiWishV1WishApprovePut(
      wishApproveRequest: WishApproveRequest(
        (b) {
          b.toUserId = userId;
        },
      ),
    );
    controller.swipeRight();
  }

  void rejectAndSwipe(String userId) async {
    await ref.read(openApiProvider).getWishApi().apiWishV1WishRejectPut(
      wishRejectRequest: WishRejectRequest(
        (b) {
          b.toUserId = userId;
        },
      ),
    );
    controller.swipeLeft();
  }

  Widget LoadingCardSwiper() {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Color.fromRGBO(240, 240, 240, 1),
        highlightColor: Colors.white,
        child: Container(
          color: Colors.grey,
          height: double.infinity,
          width: double.infinity,
        ),
      );
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
          top: 5,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: LoadingCardSwiper(),
      ),
    );
  }
}
