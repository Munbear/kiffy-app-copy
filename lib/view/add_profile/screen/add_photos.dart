import 'package:Kiffy/view/add_profile/widget/confirm_button.dart';
import 'package:Kiffy/view/add_profile/widget/photo_card.dart';
import 'package:Kiffy/view/add_profile/widget/process_guide_box.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/selected_photos.dart';

class AddPhotos extends HookConsumerWidget {
  final process;
  final processContent;
  Function showNext;

  AddPhotos({
    super.key,
    required this.process,
    required this.processContent,
    required this.showNext,
  });

  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ProcessGuideBox(content: processContent),
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
                // 없어도 될거 같음
                Center(
                  child: Icon(Icons.add),
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: ConfirmButton(
            text: "확인",
          ),
        ),
      ],
    );
  }
}
