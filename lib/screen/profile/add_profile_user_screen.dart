import 'package:Kiffy/screen_module/profile/section/profile_input_user_section.dart';
import 'package:Kiffy/screen_module/profile/widget/add_profile_header.dart';
import 'package:flutter/material.dart';

class AddProfileUserPage extends StatelessWidget {
  static String get routeLocation => "/profile/add_profile/user";
  static String get routeName => "profile_add_profile_user";

  const AddProfileUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 헤더 텍스트
              AddProfileHeader(),

              // 프로필 정보 입력
              Expanded(
                child: ProfileInputUserSection(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

