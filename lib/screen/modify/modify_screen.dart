import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/profile/section/profile_input_image_section.dart';
import 'package:flutter/material.dart';

class ModifyScreen extends StatelessWidget {
  static String get routeLocation => "/modifyScreen";
  static String get routeName => "modifyScreen";
  const ModifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // List.generate(6, (index) => null)
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentPath: ModifyScreen.routeLocation,
      ),
    );
  }
}
