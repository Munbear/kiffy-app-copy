import 'package:Kiffy/domain/check_list/widget/checked_profile_circle.dart';
import 'package:Kiffy/domain/check_list/widget/unchecked_profile_circle.dart';
import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/domain/common/custom_app_bar_image_title.dart';
import 'package:Kiffy/domain/core/widget/global_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LikedListPage extends HookConsumerWidget {
  const LikedListPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const CustomAppBarImageTitle(),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
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
                  // 확인 안한 프로필 타이틀
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
            const Spacer(),
            const CustomBottomNavigationBar(),
          ],
        ),
      ),
    );
  }
}
