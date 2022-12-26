import 'package:Kiffy/view/add_profile/widget/confirm_button.dart';
import 'package:Kiffy/view/add_profile/widget/photo_card.dart';
import 'package:Kiffy/view/add_profile/widget/process_guide_box.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/profile_guide_text_provider.dart';
import 'guide_text_box.dart';

// import 'selected_photos.dart';

class AddPhotos extends HookConsumerWidget {
  final process;
  final processContent;
  final saveValue;

  AddPhotos({
    super.key,
    required this.process,
    required this.processContent,
    required this.saveValue,
  });

  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GuideTextBox(guideTitle: "Photos", guideSubTitle: "사진을 등록해 주세요"),
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
