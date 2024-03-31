import 'package:Kiffy/constant/style/gab.dart';
import 'package:Kiffy/screen_module/common/space/widget/space.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:openapi/openapi.dart';

class OtherWishPreviewChip extends StatelessWidget {
  final UserProfileView profile;
  final VoidCallback onTap;

  const OtherWishPreviewChip({
    super.key,
    required this.profile,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: const EdgeInsets.all(2),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              border: GradientBoxBorder(
                width: 1,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment(1.9, 0.1),
                  colors: [
                    Color(0xffBA00FF),
                    Color(0xffB003FA),
                    Color(0xff960AEE),
                    Color(0xff6A15DB),
                    Color(0xff2F25BF),
                    Color(0xff0031AA),
                  ],
                ),
              ),
            ),
            child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                profile.medias[0].url,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Gab.height4,
          SizedBox(
            width: 60,
            child: Text(
              profile.name,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
