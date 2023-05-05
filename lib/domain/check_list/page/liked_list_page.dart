import 'package:Kiffy/domain/check_list/widget/checked_profile_circle.dart';
import 'package:Kiffy/domain/check_list/widget/unchecked_profile_circle.dart';
import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/explore/page/explore_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/custom_bottom_nav_bar.dart';

class LikedListPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/likedListPage";
  static String get routeName => "likedListPage";
  const LikedListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LikedListPageState();
}

class _LikedListPageState extends ConsumerState<LikedListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 확인 안한 프로필 타이틀
                  const Text(
                    "Unckecked Profile",
                    style: TextStyle(
                      color: Color(0xff494949),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 20,
                    children: [
                      UncheckedProfileCircle(),
                      UncheckedProfileCircle(),
                      UncheckedProfileCircle(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(30),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 확인한 유저 프로필
                  const Text(
                    "Ckecked Profile",
                    style: TextStyle(
                      color: Color(0xff494949),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),

                  Wrap(
                    spacing: 38,
                    runSpacing: 30,
                    children: [
                      CheckedProfileCircle(),
                      CheckedProfileCircle(),
                      CheckedProfileCircle(),
                      CheckedProfileCircle(),
                      CheckedProfileCircle(),
                      CheckedProfileCircle(),
                    ],
                  ),
                ],
              ),
            ),
            // const Spacer(),
            // const CustomBottomNavigationBar(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPath: ExplorePage.routeLocation),
    );
  }
}
