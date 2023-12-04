import 'package:Kiffy/screen_module/common/bottom_nav/widget/bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/common/google_admob/admob_banner_widget.dart';
import 'package:Kiffy/screen_module/common/other_wish_user/section/other_wish_preview_section.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/match/section/matched_user_card_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MatchingScreen extends StatelessWidget {
  static String get routeLocation => "/matching";
  static String get routeName => "matching";

  const MatchingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 위시 리스트
          const OtherWishPreviewSection(),

          const Space(height: 8),
          const AdmobBannerWidget(),
          const Space(height: 8),

          // Match 캡션
          Padding(
            padding: const EdgeInsets.only(left: 26, top: 12),
            child: Text(
              tr("text.match.my_matches"),
              style: const TextStyle(
                color: Color(0xff494949),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // 매칭된 유저 카드 섹션
          const MatchedUserCardSection(),
        ],
      ),
    );
  }
}
