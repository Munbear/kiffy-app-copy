import 'package:Kiffy/screen_module/common/bottom_nav/widget/bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/common/other_wish_user/section/other_wish_preview_section.dart';
import 'package:Kiffy/screen_module/explore/section/explore_user_card_section.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  static String get routeName => "explore";
  static String get routeLocation => "/explore";

  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
    );
  }
}
