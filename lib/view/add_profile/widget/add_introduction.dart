import 'package:Kiffy/view/add_profile/widget/confirm_button.dart';
import 'package:Kiffy/view/add_profile/widget/process_guide_box.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddIntroduction extends HookConsumerWidget {
  final processContent;
  const AddIntroduction({super.key, required this.processContent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ProcessGuideBox(content: processContent),
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
                  )),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const ConfirmButton(text: "확인"),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
