import 'package:Kiffy/screen_module/wish/provider/wish_remain_calculator.dart';
import 'package:Kiffy/screen_module/wish/widget/other_wish_user_profile_chip_expired.dart';
import 'package:Kiffy/screen_module/wish/widget/other_wish_user_profile_chip_reamined.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserProfileChip extends StatelessWidget {
  final OtherWishUserProfileView otherWish;
  final WishRemained remained;
  final VoidCallback onRemainedProfileTap;

  const OtherWishUserProfileChip(
      {super.key,
      required this.otherWish,
      required this.remained,
      required this.onRemainedProfileTap});

  Widget ProfileChip() {
    if (remained.isRemained()) {
      return OtherWishUserProfileChipRemained(
        otherWish: otherWish,
        onTap: onRemainedProfileTap,
      );
    }

    return OtherWishUserProfileChipExpired(otherWish: otherWish);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ProfileChip(),
          ...[
            remained.isRemained()
                ? Text(
                    remained.remainedDurationHHmmss(),
                    style: TextStyle(
                      color: Color(0xff0031AA),
                      fontSize: 13,
                    ),
                  )
                : Text(
                    tr("text.wish.other_wishes.expired"),
                    style: TextStyle(color: Colors.grey),
                  )
          ],
        ],
      ),
    );
  }
}
