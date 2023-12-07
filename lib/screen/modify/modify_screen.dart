import 'package:Kiffy/screen_module/common/bottom_nav/widget/bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/modify/section/modify_profile_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ModifyScreen extends StatelessWidget {
  static String get routeLocation => "/modifyScreen";
  static String get routeName => "modifyScreen";
  const ModifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0.5,
        title: CustomAppBar(
          title: tr("text.my.modify_profile"),
          titleColor: const Color(0xff0031AA),
          fontSize: 20,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(39),
          child: ModifyProfileSection(),
        ),
      ),
    );
  }
}
