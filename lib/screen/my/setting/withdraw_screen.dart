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
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0.5,
        title: CustomAppBar(
          title: tr("text.my.setting.withdrawal"),
          titleColor: const Color(0xff828282),
          fontSize: 20,
        ),
      ),
      body: WithdrawalSection(),
      //TODO
      // bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
