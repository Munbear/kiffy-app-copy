import 'package:Kiffy/view/legacy_add_profile/widget/guide_text_box.dart';

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddIntro extends HookConsumerWidget {
  final processContent;

  const AddIntro({
    super.key,
    required this.processContent,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          // 가이드 고정 텍스트
          const GuideTextBox(guideTitle: "자기소개서", guideSubTitle: "자기소개서를 작성해 주세요"),
          const SizedBox(height: 30),
          Expanded(
            child: TextFormField(
              maxLines: 6,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 19, vertical: 11),
                hintText: "perkenalan diri",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Color(0xff0031AA)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7),
                  borderSide: const BorderSide(color: Color(0xff0031AA)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
