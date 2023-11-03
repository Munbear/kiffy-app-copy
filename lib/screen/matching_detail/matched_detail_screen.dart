import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/screen_module/matched_detail/section/matched_detail_section.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class MatchedDetailScreen extends StatelessWidget {
  static String get routeLocation => "/matchingDetail";
  static String get routeName => "matchingDetail";

  final MatchedUserView matchedUser;
  const MatchedDetailScreen({super.key, required this.matchedUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 14, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 매칭 유저 디테일 프로필 카드
              MatchedDetailSection(
                matchedUser: matchedUser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
