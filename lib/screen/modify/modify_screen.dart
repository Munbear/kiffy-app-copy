import 'package:Kiffy/screen_module/common/bottom_nav/widget/bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/modify/section/modify_intro_section.dart';
import 'package:Kiffy/screen_module/modify/section/modify_photo_section.dart';
import 'package:Kiffy/screen_module/profile/widget/profile_input_images.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ModifyScreen extends StatelessWidget {
  static String get routeLocation => "/modifyScreen";
  static String get routeName => "modifyScreen";
  const ModifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// 프로필 사진 캡션
              SizedBox(height: 8),
              // 프로필 이미지 수정
              // ProfileInputImages()
              ModifyPhotoSection(),
              Space(height: 40),
              // 자기소개
              ModiftyIntroSection()
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentPath: ModifyScreen.routeLocation,
      ),
    );
  }
}
