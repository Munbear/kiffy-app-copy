import 'package:Kiffy/screen_module/common/style/widget/border._style.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';
import 'package:openapi/openapi.dart';

class OtherWishUserProfileChipExpired extends StatelessWidget {
  final OtherWishUserProfileView otherWish;

  const OtherWishUserProfileChipExpired({super.key, required this.otherWish});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BorderGradientBorderRadius50.outlineGreyBoxDecoration,
          child: Container(
            padding: const EdgeInsets.all(4),
            width: 80,
            height: 80,
            decoration: BorderGradientBorderRadius50.innerDecoration,
            child: Stack(
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    otherWish.userProfile.medias.first.url,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                  ),
                  clipBehavior: Clip.hardEdge,
                )
              ],
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
