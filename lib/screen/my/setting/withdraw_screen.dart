import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/my_setting/section/withdrawal_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  static String get routeLocation => "/withdraw";
  static String get routeName => "withdraw";

  const WithdrawalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        hasLeading: false,
        title: tr("text.my.setting.withdrawal"),
      ),
      body: WithdrawalSection(),
      //TODO
      // bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
