import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_item_info.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page_item_media.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class UserProfileCardPageDefault extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final int age;
  final ZodiacTypeEnumView? zodiac;
  final MBTITypeEnumView? mbti;
  final String? weight;
  final String? height;
  final List<String>? tags;
  final List<ProfileTagViewTagTypesInner>? tagTypes;
  final bool isMyScreen;

  const UserProfileCardPageDefault(
      {super.key,
      required this.profileImageUrl,
      required this.name,
      required this.age,
      this.zodiac,
      this.mbti,
      this.height,
      this.weight,
      this.tags,
      this.tagTypes,
      required this.isMyScreen});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserProfileCardPageItemMedia(profileImageUrl: profileImageUrl),
        Positioned(
          left: 25,
          right: isMyScreen ? 25 : 80,
          bottom: 20,
          child: UserProfileCardPageItemInfo(
            name: name,
            age: age,
            zodiac: zodiac,
            mbti: mbti,
            weight: weight,
            height: height,
            tags: tags,
            tagTypes: tagTypes,
          ),
        )
      ],
    );
  }
}
