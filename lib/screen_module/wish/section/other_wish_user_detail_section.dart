import 'dart:async';

import 'package:Kiffy/screen_module/common/skeleton/widget/skeleton.dart';
import 'package:Kiffy/screen_module/common/user_profile_card/widget/user_profile_card.dart';
import 'package:Kiffy/screen_module/wish/provider/other_wish_user_reader.dart';
import 'package:Kiffy/screen_module/wish/provider/wish_manager.dart';
import 'package:Kiffy/screen_module/wish/provider/wish_remain_calculator.dart';
import 'package:Kiffy/screen_module/wish/section/other_wish_user_detail_time_remained_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserDetailSection extends ConsumerStatefulWidget {
  final String wishId;

  const OtherWishUserDetailSection({super.key, required this.wishId});

  @override
  ConsumerState<OtherWishUserDetailSection> createState() =>
      _OtherWishUserDetailSectionState();
}

class _OtherWishUserDetailSectionState
    extends ConsumerState<OtherWishUserDetailSection> {
  OtherWishUserProfileView? wishUserProfileView;
  Timer? _timer;
  WishRemained? remained;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(otherWishUserReaderProvider)
          .getOtherWishUserProfile(widget.wishId)
          .then((value) {
        setState(() {
          wishUserProfileView = value;
        });
      });
    });
  }

  void approveAndPop(String userId) {
    ref
        .read(wishManagerProvider)
        .approve(userId)
        .then((value) => context.pop());
  }

  void rejectAndPop(String userId) {
    ref.read(wishManagerProvider).reject(userId).then((value) => context.pop());
  }

  @override
  Widget build(BuildContext context) {
    if (wishUserProfileView == null) {
      return const Padding(
        padding: EdgeInsets.all(20),
        child: SizedBox(
          height: 600,
          child: Skeleton(),
        ),
      );
    }

    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Container(
          padding: EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SizedBox(
            height: 600,
            child: UserProfileCard(
              userProfile: wishUserProfileView!.userProfile,
              onWish: (wishId) {
                approveAndPop(wishUserProfileView!.userProfile.id);
              },
              onReject: (wishId) {
                rejectAndPop(wishUserProfileView!.userProfile.id);
              },
            ),
          ),
        ),
        OtherWishUserDetailTimeRemainedSection(
          wishUserProfileView: wishUserProfileView!,
        ),
      ],
    );
  }
}
