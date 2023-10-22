import 'package:Kiffy/screen_module/profile/section/profile_input_complete_section.dart';
import 'package:flutter/material.dart';

class AddProfileCompletePage extends StatelessWidget {
  static String get routeLocation => "/profile/add_profile/complete";
  static String get routeName => "profile_add_profile_complete";

  const AddProfileCompletePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Image.asset("assets/images/kiffy_logo_purple.png", width: 69),
        ),
        body: const ProfileInputCompleteSection(),
      ),
    );
  }
}