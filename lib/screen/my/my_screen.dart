import 'package:Kiffy/screen_module/common/custom_app_bar/widget/custom_app_bar.dart';
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
    return const Scaffold(
      appBar: CustomAppBar(
        hasLeading: false,
      ),
      body: Column(
        children: [
          MyProfileCardSection(),
          MyButtonSection(),
        ],
      ),
    );
  }
}
