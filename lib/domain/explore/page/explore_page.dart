import 'package:Kiffy/domain/common/preview_liked_list.dart';
import 'package:Kiffy/domain/common/user_profile_card.dart';
import 'package:Kiffy/infra/explore_client.dart';
import 'package:Kiffy/infra/wish_client.dart';
import 'package:Kiffy/model/wish_other_profiles_view/wish_other_profiles_view.dart';
import 'package:flutter/material.dart';
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
  late List<WishOtherProfilesView>? wishUsers;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 탐색할 사용자 리스트 불러오기
      ref.watch(exploreProvider).getExploreUserProfiles();
      // 나에게 위시한 사용자 불러오기
      ref.watch(wishClientProvider).getWishOthersProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProfiles = ref.watch(useruserProfilesProvider);
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

            // 유저 프로필 카드
            if (userProfiles != null) userProfiles.list.isNotEmpty ? UserProfileCard(userProfile: userProfiles.list[0]) : const NoUserProfileCard(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPath: ExplorePage.routeLocation),
    );
  }
}
