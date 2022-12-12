import 'package:Kiffy/view/add_profile/widget/process_guide_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/confirm_button.dart';
import '../widget/selected_gender.dart';
import '../widget/setting_birth.dart';
import '../widget/setting_nick_name.dart';
import 'add_profile.dart';

class AddUserInfo extends HookConsumerWidget {
  final process;
  final processContent;
  Function showNext;

  AddUserInfo({
    super.key,
    required this.process,
    required this.processContent,
    required this.showNext,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 45),
      child: Column(
        children: [
          Form(
            child: Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  child: Column(
                    children: [
                      // 가이드 텍스트
                      ProcessGuideBox(content: processContent),

                      // 공간 여백
                      const SizedBox(height: 60),

                      // 성별 선택
                      SelectedGender(isShowed: process.value == ProfileEditProcess.gender),

                      // 생년월일
                      AddBirthTextForm(
                          hinText: "Birth day",
                          labelText: "Birth day",
                          isShowed: [ProfileEditProcess.gender, ProfileEditProcess.birthday].contains(process.value)),

                      // 닉네임 기본으로 보여줌
                      SettingNickName(hinText: "NickName", labelText: "NickName", isShowed: [ProfileEditProcess.birthday].contains(process.value)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              showNext(process);
            },
            child: const ConfirmButton(text: "확인"),
          ),
        ],
      ),
    );
  }
}
