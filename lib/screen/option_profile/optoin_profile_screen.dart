import 'package:Kiffy/constant/option_profile_type.dart';
import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditOptionProfileScreen extends ConsumerWidget {
  static String get routeName => "editOptionProfile";
  static String get routeLocation => "/editOptionProfile";
  // final OptionProfileType editProfileType;
  // final String title;

  const EditOptionProfileScreen({
    super.key,
    // required this.title,
    // required this.editProfileType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Column(
        children: [
          // Text(title),
          Text("ㅇㄹㄴㅇㄹㄴㅇㄹㄴㅇ"),
        ],
      ),
    );
  }
}
