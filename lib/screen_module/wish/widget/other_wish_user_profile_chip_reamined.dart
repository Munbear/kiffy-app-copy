import 'package:Kiffy/domain/common/border._style.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserProfileChipRemained extends StatelessWidget {
  final OtherWishUserProfileView otherWish;
  final VoidCallback onTap;

  const OtherWishUserProfileChipRemained(
      {super.key, required this.otherWish, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BorderGradientBorderRadius50.outlineGradientBoxDecoration,
          child: Container(
            padding: const EdgeInsets.all(4),
            width: 80,
            height: 80,
            decoration: BorderGradientBorderRadius50.innerDecoration,
            child: GestureDetector(
              onTap: onTap,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  otherWish.userProfile.medias.first.url,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const Space(height: 8),
        Text(
          otherWish.userProfile.name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
