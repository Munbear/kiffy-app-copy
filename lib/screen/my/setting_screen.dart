import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/my/widget/setting_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screen_module/sign/provider/auth_provider.dart';

class SettingScreen extends ConsumerStatefulWidget {
  static String get routeLocation => "/setting";
  static String get routeName => "setting";

  const SettingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingScreenState();
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0,
        leading: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
          ),
        ),
        title: const Text(
          "Setting",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xff0031AA),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: GestureDetector(
              onTap: () async {
                // 로그아웃 함수 추가
                await ref.read(authProvider).logout();
                context.replace("/");
              },
              child: SettingButton(
                  IconPath: "assets/images/log_out.png",
                  text: tr("text.my.setting.logout")),
            ),
          ),
          const SizedBox(height: 30),
          // 회원 탈퇴 화면으로
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: GestureDetector(
              onTap: () => ref.read(routerProvider).pushNamed("withdraw"),
              child: SettingButton(
                  IconPath: "assets/images/withdrawal_img.png",
                  text: tr("text.my.setting.withdrawal")),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
