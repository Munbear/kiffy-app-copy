import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/common/google_admob/admob_banner_widget.dart';
import 'package:Kiffy/screen_module/explore/section/other_wish_preview_section.dart';
import 'package:Kiffy/screen_module/match/section/feed_section.dart';
import 'package:Kiffy/screen_module/match/section/matched_user_card_section.dart';
import 'package:Kiffy/screen_module/match/section/preview_matching_user_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: const CustomAppBar(hasLeading: false),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 프리뷰 매칭 리스트
          // TODO api 연결
          PreviewMatchingUserSection(),
          // Gab.height8,
          // AdmobBannerWidget(),
          // Gab.height8,

          // 커뮤니티 feed
          Expanded(
            child: FeedSection(),
          ),

          // 매칭된 유저 카드 섹션
          // const MatchedUserCardSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {},
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xffBA00FF),
                Color(0xff0031AA),
              ],
            ),
          ),
          child: Center(
            child: SvgPicture.asset("assets/svg/icn_write.svg"),
          ),
        ),
      ),
    );
  }
}
