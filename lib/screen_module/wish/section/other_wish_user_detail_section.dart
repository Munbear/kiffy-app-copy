import 'package:Kiffy/screen_module/common/widget/user_profile_card/user_profile_card.dart';
import 'package:Kiffy/screen_module/wish/provider/other_wish_user_reader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  @override
  Widget build(BuildContext context) {
    if (wishUserProfileView == null) {
      return Placeholder();
    }

    print(wishUserProfileView);

    return UserProfileCard(
        userProfile: wishUserProfileView!.userProfile,
        onWish: (wishId) {},
        onReject: (wishId) {});
  }
}
