import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/my/section/my_page_button_section.dart';
import 'package:Kiffy/screen_module/my/section/my_profile_card_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../screen_module/common/bottom_nav/widget/bottom_nav_bar.dart';

class MyScreen extends ConsumerStatefulWidget {
  static String get routeLocation => "/myPage";
  static String get routeName => "myPage";

  const MyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyScreen> {
  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          MyProfileCardSection(),
          Space(height: 16),
          MyButtonSection(),
        ],
      ),
    );
  }
}
