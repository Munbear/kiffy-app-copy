import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_item_intro.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_item_media.dart';
import 'package:flutter/material.dart';

class UserProfileCardPageIntro extends StatelessWidget {
  final String profileImageUrl;
  final String intro;

  const UserProfileCardPageIntro(
      {super.key, required this.profileImageUrl, required this.intro});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserProfileCardPageItemMedia(profileImageUrl: profileImageUrl),
        Container(
          color: Color.fromRGBO(0, 0, 0, 0.5),
        ),
        Positioned(
          left: 0,
          bottom: 0,
          child: UserProfileCardPageItemIntro(intro: intro),
        )
      ],
    );
  }
}
