import 'package:Kiffy/view/add_profile/widget/photo_card.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'guide_text_box.dart';

// import 'selected_photos.dart';

class AddPhotos extends HookConsumerWidget {
  final process;
  final processContent;

  const AddPhotos({
    super.key,
    required this.process,
    required this.processContent,
  });

  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // 고정 가이드 텍스
                const GuideTextBox(guideTitle: "Photos", guideSubTitle: "사진을 등록해 주세요"),

                const SizedBox(height: 20),
                Wrap(
                  children: [
                    PhotoCard(),
                    PhotoCard(),
                    PhotoCard(),
                    PhotoCard(),
                    PhotoCard(),
                    PhotoCard(),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
