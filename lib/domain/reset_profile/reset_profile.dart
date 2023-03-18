import 'package:Kiffy/domain/common/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../common/custom_app_bar.dart';

class ResetProfile extends HookConsumerWidget {
  const ResetProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        centerTitle: true,
        titleSpacing: 0,
        elevation: 0.5,
        title: const CustomAppBar(
          title: "Modify Profile",
          titleColor: Color(0xff0031AA),
          fontSize: 20,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          children: [
            Container(
              color: Colors.red,
              child: Text("프로필 수정하기"),
            )
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentPath: "/mypage"),
    );
  }
}
