import 'package:Kiffy/screen_module/profile/section/profile_input_image_section.dart';
import 'package:flutter/material.dart';

class AddProfileImageScreen extends StatelessWidget {
  static String get routeLocation => "/profile/add_profile/image";
  static String get routeName => "profile_add_profile_image";

  const AddProfileImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: false,
      body: ProfileInputImageSection(),
    );
  }
}