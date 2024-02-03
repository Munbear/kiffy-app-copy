import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/common/google_admob/admob_banner_widget.dart';
import 'package:Kiffy/screen_module/explore/section/other_wish_preview_section.dart';
import 'package:Kiffy/screen_module/match/section/matched_user_card_section.dart';
import 'package:Kiffy/screen_module/match/section/preview_matching_user_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: const CustomAppBar(hasLeading: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 프리뷰 매칭 리스트
          const PreviewMatchingUserSection(),
          Gab.height8,
          const AdmobBannerWidget(),
          Gab.height8,

          // Match 캡션
          // Padding(
          //   padding: const EdgeInsets.only(left: 26, top: 12),
          //   child: Text(
          //     tr("text.match.my_matches"),
          //     style: const TextStyle(
          //       color: Color(0xff494949),
          //   I

          // 매칭된 유저 카드 섹션
          const MatchedUserCardSection(),
        ],
      ),
    );
  }
}
