import 'package:Kiffy/domain/common/reject_circle_button.dart';
import 'package:Kiffy/domain/common/wish_circle_button.dart';
import 'package:Kiffy/screen_module/common/widget/space.dart';
import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card_page.dart';
import 'package:flutter/material.dart';
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
        Positioned(
          right: 25,
          bottom: 20,
          child: Column(
            children: [
              RejectCircleButton(onClick: () {
                widget.onReject(widget.userProfile.id);
              }),
              const Space(height: 12),
              WishCircleButton(
                onClick: () {
                  widget.onWish(widget.userProfile.id);
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
