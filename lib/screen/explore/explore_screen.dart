import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/explore/section/explore_user_card_section.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: CustomAppBar(
        hasLeading: false,
      ),
      body: Column(
        children: [
          // 나에게 위시 보낸 유저 리스트
          // PreviewWishedMeSection(),
          // 탐색할 유저 카드
          ExploreUserProfileCardSection(),
        ],
      ),
    );
  }
}
