import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/common/user_profile_card.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/screen_module/common/provider/my_provider.dart';
import 'package:Kiffy/screen_module/explore/section/other_wish_preview_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/common/custom_bottom_nav_bar.dart';
import '../../screen_module/explore/section/explore_user_card_section.dart';
import '../../screen_module/explore/widget/no_user_profile_card.dart';

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
      ref.read(exploreProvider).getExpolreUserCard();
      // 위시 받은 리스트 불러오기
      // ref.read(wishClientProvider).getWishOthersProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userCards = ref.watch(userCardsProvider);
    final isLoading = ref.watch(userCardLoading);
    ref.watch(wishCount);

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
            const OtherWishPreviewSection(),

            isLoading
                ? const Center(child: CircularProgressIndicator())
                : userCards.isNotEmpty
                    // 유저 카드
                    ? ExploreUserCardSection()
                    : const NoUserProfileCard(),
          ],
        ),
      ),
      bottomNavigationBar:
          CustomBottomNavBar(currentPath: ExplorePage.routeLocation),
    );
  }
}
