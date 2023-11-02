import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:Kiffy/screen_module/modify/section/photo_list_section.dart';
import 'package:flutter/material.dart';

class ModifyScreen extends StatelessWidget {
  static String get routeLocation => "/modifyScreen";
  static String get routeName => "modifyScreen";
  const ModifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 프로필 사진 캡션
            Row(
              children: [
                Text('Select your pictures'),
              ],
            ),
            SizedBox(height: 8),
            PhotoListSection(),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentPath: ModifyScreen.routeLocation,
      ),
    );
  }
}
