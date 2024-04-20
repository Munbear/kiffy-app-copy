import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/matched_detail/section/matched_detail_section.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class MatchedDetailScreen extends StatelessWidget {
  static String get routeLocation => "/matchingDetail";
  static String get routeName => "matchingDetail";

  final MatchedUserView matchedUser;
  const MatchedDetailScreen({
    super.key,
    required this.matchedUser,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        hasLeading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          // 매칭 유저 디테일 프로필 카드
          child: MatchedDetailSection(
            matchedUser: matchedUser,
          ),
        ),
      ),
    );
  }
}
