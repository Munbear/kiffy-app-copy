import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card_page_item_info.dart';
import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card_page_item_media.dart';
import 'package:flutter/material.dart';

class UserProfileCardPageDefault extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final int age;

  const UserProfileCardPageDefault({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.age,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserProfileCardPageItemMedia(profileImageUrl: profileImageUrl),
        Positioned(
          left: 0,
          bottom: 0,
          child: UserProfileCardPageItemInfo(name: name, age: age),
        )
      ],
    );
  }
}
