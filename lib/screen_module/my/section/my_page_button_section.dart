import 'package:Kiffy/screen_module/my/widget/my_page_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyButtonSection extends ConsumerStatefulWidget {
  const MyButtonSection({super.key});

  @override
  ConsumerState<MyButtonSection> createState() => _MyButtonSectionState();
}

class _MyButtonSectionState extends ConsumerState<MyButtonSection> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Row(
        children: [
          MyButton(
            text: "Modify Profile",
            iconPath: "assets/images/modify_x3.png",
            routePathName: "resetProfile",
          ),
          SizedBox(width: 22),
          MyButton(
            text: "Setting",
            iconPath: "assets/images/setting_x3.png",
            routePathName: "setting",
          ),
        ],
      ),
    );
  }
}
