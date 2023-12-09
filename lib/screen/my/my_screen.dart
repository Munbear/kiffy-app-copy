import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/my/section/my_page_button_section.dart';
import 'package:Kiffy/screen_module/my/section/my_profile_card_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyScreen extends ConsumerStatefulWidget {
  const MyScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Image.asset(
          width: 70,
          height: 55,
          "assets/images/kiffy_logo_purple.png",
        ),
      ),
      body: const Column(
        children: [
          MyProfileCardSection(),
          Space(height: 16),
          MyButtonSection(),
        ],
      ),
    );
  }
}
