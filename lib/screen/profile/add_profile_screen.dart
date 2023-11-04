import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/profile/section/profile_input_process_section.dart';
import 'package:flutter/material.dart';

class AddProfileScreen extends StatelessWidget {
  static String get routeLocation => "/profile/add_profile";
  static String get routeName => "profile_add_profile";

  const AddProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            ProfileInputProcessSection(),
            Space(height: 40),
          ],
        ),
      ),
    );
  }
}
