import 'package:Kiffy/screen_module/common/widget/space.dart';
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
      // 디테일 화면으로 이동

      onTap: () => onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 7, vertical: 6),
        child: Column(
          children: [
            Container(
              width: 60,
              height: 60,
              clipBehavior: Clip.hardEdge,
              padding: const EdgeInsets.all(2),
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
            const Space(height: 5),
            SizedBox(
              width: 60,
              child: Text(
                profile.name,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
