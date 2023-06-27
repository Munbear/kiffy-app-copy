import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/common/user_profile_card.dart';
import 'package:Kiffy/domain/my_page/provider/user_profile_info.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_bottom_nav_bar.dart';
import '../widget/no_user_profile_card.dart';

class ExplorePage extends ConsumerStatefulWidget {
  static String get routeName => "explore";
  static String get routeLocation => "/explore";

  const ExplorePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ExplorePageState();
}

class _ExplorePageState extends ConsumerState<ExplorePage> {
  final CardSwiperController controller = CardSwiperController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 탐색할 사용자 리스트 불러오기
      await ref.read(exploreProvider).getExpolreUserCard();

      await ref.read(wishClientProvider).getWishOthersProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCards = ref.watch(userCardsProvider);
    final isLoading = ref.watch(userCardLoading);
    ref.watch(wishCount);
    setState(() {});

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // 나에게 위시 보낸 유저 리스트
            const PreviewLikedList(),

            // 유저 카드
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : userCards.isNotEmpty
                    ? Expanded(
                        child: CardSwiper(
                          controller: controller,
                          isHorizontalSwipingEnabled: false,
                          isVerticalSwipingEnabled: false,
                          isLoop: false,
                          padding: EdgeInsets.zero,
                          initialIndex: 0,
                          onEnd: () {
                            if (ref.watch(wishCount) >= 3) ref.read(exploreProvider).getExpolreUserCard();
                          },
                          numberOfCardsDisplayed: userCards.length <= 1 ? 1 : 2,
                          cardsCount: userCards.length,
                          cardBuilder: (context, index) {
                            return UserProfileCard(
                              userProfile: userCards[index],
                              controller: controller,
                            );
                          },
                        ),
                      )
                    : const NoUserProfileCard(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPath: ExplorePage.routeLocation),
    );
  }
}
