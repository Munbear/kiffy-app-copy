import 'package:Kiffy/config/router/route.dart';
import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/my/widget/setting_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../screen_module/sign/provider/auth_provider.dart';

class SettingScreen extends ConsumerWidget {
  static String get routeLocation => "/setting";
  static String get routeName => "setting";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        hasLeading: true,
        title: "Setting",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SettingButton(
            onTap: () {
              ref.read(authProvider).logout().then(
                    (value) => context.replace("/"),
                  );
            },
            icon: const Icon(Icons.logout),
            text: tr("text.my.setting.logout"),
          ),

          // 회원 탈퇴 화면으로
          SettingButton(
            onTap: () {
              ref.read(routerProvider).pushNamed("withdraw");
            },
            icon: const Icon(Icons.do_disturb),
            text: tr("text.my.setting.withdrawal"),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
