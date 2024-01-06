import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:Kiffy/screen_module/profile/section/modify_profile/modify_profile_section.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ModifyScreen extends StatelessWidget {
  static String get routeLocation => "/modifyScreen";
  static String get routeName => "modifyScreen";
  const ModifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        hasLeading: true,
        title: tr("text.my.modify_profile"),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: ModifyProfileSection(),
        ),
      ),
    );
  }
}
