import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_page.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_reject_button.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card_wish_button.dart';
import 'package:Kiffy/screen_module/explore/provider/explore_users_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/openapi.dart';

class UserProfileCard extends StatefulWidget {
  final UserProfileView userProfile;
  final Function(String) onWish;
  final Function(String) onReject;

  const UserProfileCard({
    super.key,
    required this.userProfile,
    required this.onWish,
    required this.onReject,
  });

  @override
  State<UserProfileCard> createState() => _UserProfileCardState();
}

class _UserProfileCardState extends State<UserProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        UserProfileCardPage(userProfile: widget.userProfile),
        // 버튼 영역
        Positioned(
          right: 20,
          bottom: 20,
          child: Consumer(builder: (context, ref, child) {
            return Column(
              children: [
                RejectCircleButton(onClick: () {
                  ref.invalidate(currentImagePage);
                  widget.onReject(widget.userProfile.id);
                }),
                const Space(height: 12),
                WishCircleButton(
                  onClick: () {
                    ref.invalidate(currentImagePage);
                    widget.onWish(widget.userProfile.id);
                  },
                ),
              ],
            );
          }),
        )
      ],
    );
  }
}
