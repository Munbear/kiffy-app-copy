import 'package:Kiffy/domain/common/custom_app_bar.dart';
import 'package:Kiffy/screen_module/common/bottom_nav/widget/bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/my_setting/section/withdrawal_section.dart';
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
        title: const CustomAppBar(
          title: "Withdrawal",
          titleColor: Color(0xff828282),
          fontSize: 20,
        ),
      ),
      body: WithdrawalSection(),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
