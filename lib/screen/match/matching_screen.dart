import 'package:Kiffy/screen/create_feed/create_feed_screen.dart';
import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/match/section/feed_nav_bar_section.dart';
import 'package:Kiffy/screen_module/match/section/feed_section.dart';
import 'package:Kiffy/screen_module/match/section/preview_matching_user_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

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
          PreviewMatchingUserSection(),

          // 게시글 네비게이션 바
          FeedNavBarSection(),

          // 커뮤니티 피드
          FeedSection(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          context.pushNamed(CreateFeedScreen.routeName);
        },
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
