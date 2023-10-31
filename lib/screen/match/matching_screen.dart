import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/common/widget/other_wish_user/other_wish_preview_section.dart';
import 'package:Kiffy/screen_module/match/section/matched_user_card_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MatchingScreen extends StatelessWidget {
  static String get routeLocation => "/matching";
  static String get routeName => "matching";

  const MatchingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 위시 리스트
          OtherWishPreviewSection(),

          // Match 캡션
          Padding(
            padding: EdgeInsets.only(left: 26, top: 12),
            child: Text(
              "Matches",
              style: TextStyle(
                color: Color(0xff494949),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // 매칭된 유저 카드 섹션
          MatchedUserCardSection(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentPath: MatchingScreen.routeLocation,
      ),
    );
  }
}
