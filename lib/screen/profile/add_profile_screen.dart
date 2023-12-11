import 'package:Kiffy/screen_module/profile/section/add_profile/add_profile_process_section.dart';
import 'package:flutter/material.dart';

class AddProfileScreen extends StatelessWidget {
  static String get routeLocation => "/profile/add_profile";
  static String get routeName => "profile_add_profile";

  const AddProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: AddProfileProcessSection(),
      ),
    );
  }
}
