import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/common/widget/other_wish_user/other_wish_preview_section.dart';
import 'package:Kiffy/screen_module/explore/section/explore_user_card_section.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  static String get routeName => "explore";
  static String get routeLocation => "/explore";

  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const SafeArea(
        bottom: false,
        child: Column(
          children: [
            // 나에게 위시 보낸 유저 리스트
            OtherWishPreviewSection(),
            // 탐색할 유저 카드
            ExploreUserProfileCardSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentPath: ExploreScreen.routeLocation,
      ),
    );
  }
}
