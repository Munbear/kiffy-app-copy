import 'package:Kiffy/screen_module/profile/section/add_profile/add_basic_profile_section.dart';
import 'package:flutter/material.dart';

class AddBasicProfileScreen extends StatelessWidget {
  static String get routeLocation => "/add_basic_profile_screen";
  static String get routeName => "add_basic_profile_screen";

  const AddBasicProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: AddBasicProfileSection(),
      ),
    );
  }
}
