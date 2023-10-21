import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/domain/common/custom_app_bar.dart';
import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/domain/setting_page/widget/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../screen_module/sign/provider/auth_provider.dart';

class SettingPage extends ConsumerStatefulWidget {
  static String get routeLocation => "/setting";
  static String get routeName => "setting";

  const SettingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0.5,
        title: const CustomAppBar(
          title: "Setting",
          titleColor: Color(0xff0031AA),
          fontSize: 20,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: GestureDetector(
              onTap: () {
                // 로그아웃 함수 추가
                ref.read(authProvider).logout();
              },
              child: const SettingButton(
                  IconPath: "assets/images/log_out.png", text: "Log out"),
            ),
          ),
          const SizedBox(height: 30),
          // 회원 탈퇴 화면으로
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: GestureDetector(
              onTap: () => ref.read(routerProvider).pushNamed("withdraw"),
              child: const SettingButton(
                  IconPath: "assets/images/withdrawal_img.png",
                  text: "Withdrawal"),
            ),
          ),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
