import 'package:Kiffy/screen/my/setting_screen.dart';
import 'package:Kiffy/screen/profile/modify_profile_screen.dart';
import 'package:Kiffy/screen_module/my/widget/my_page_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MyButtonSection extends ConsumerStatefulWidget {
  const MyButtonSection({super.key});

  @override
  ConsumerState<MyButtonSection> createState() => _MyButtonSectionState();
}

class _MyButtonSectionState extends ConsumerState<MyButtonSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          // 프로필 수정
          MyButton(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return const ModifyScreen();
                  },
                ),
              );
            },
            text: tr("text.my.modify_profile"),
            iconPath: "assets/images/modify_x3.png",
          ),
          const SizedBox(width: 22),
          // 설정
          MyButton(
            onTap: () {
              context.pushNamed(SettingScreen.routeName);
            },
            text: tr("text.my.setting"),
            iconPath: "assets/images/setting_x3.png",
          ),
        ],
      ),
    );
  }
}
