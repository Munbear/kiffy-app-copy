import 'package:Kiffy/screen_module/profile/section/add_profile/add_option_profile_section.dart';
import 'package:flutter/material.dart';

class AddOptionProfileScreen extends StatelessWidget {
  static String get routeLocation => "/add_option_profile_screen";
  static String get routeName => "add_option_profile_screen";
  const AddOptionProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddOptionProfileSection(),
    );
  }
}
