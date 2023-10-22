import 'package:Kiffy/screen_module/profile/section/profile_input_contact_section.dart';
import 'package:flutter/material.dart';

class AddProfileContactScreen extends StatelessWidget {
  static String get routeLocation => "/profile/add_profile/contact";
  static String get routeName => "profile_add_profile_contact";

  const AddProfileContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: ProfileInputContactSection(),
    );
  }
}