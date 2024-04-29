import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/create_feed/section/create_feed_image_section.dart';
import 'package:Kiffy/screen_module/create_feed/section/feed_submit_section.dart';
import 'package:Kiffy/screen_module/create_feed/section/feed_text_section.dart';
import 'package:Kiffy/screen_module/create_feed/section/user_info_tile_section.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateFeedScreen extends StatelessWidget {
  static String get routeName => 'createFeed';
  static String get routeLocation => '/createFeed';

  const CreateFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 96,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "cancel",
              style: textStyle.titleSmall,
            ),
          ),
        ),
        actions: const [
          FeedSubmitSection(),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // 유저 정보
                      const UserInfoTileSection(),

                      Gab.height12,
                      Container(height: 1, color: Colors.grey[400]),

                      // 텍스트 영역
                      const FeedTextSection()
                    ],
                  ),
                ),
              ),
            ),

            // 이미지 프리뷰
            const CreateFeedImageSection()
          ],
        ),
      ),
    );
  }
}
