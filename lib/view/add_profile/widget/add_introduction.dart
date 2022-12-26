import 'package:Kiffy/view/add_profile/widget/confirm_button.dart';
import 'package:Kiffy/view/add_profile/widget/process_guide_box.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class AddIntroduction extends HookConsumerWidget {
  final processContent;
  final saveValue;

  const AddIntroduction({
    super.key,
    required this.processContent,
    required this.saveValue,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "Introduction",
                    style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: Text(
                    "자기소개를 입력해 주세요",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
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
