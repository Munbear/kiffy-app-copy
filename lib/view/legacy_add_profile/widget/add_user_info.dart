import 'package:Kiffy/view/legacy_add_profile/widget/process_guide_box.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'selected_gender.dart';
import 'setting_birth.dart';
import 'setting_nick_name.dart';
import '../screen/legacy_add_profile.dart';

class AddUserInfo extends HookConsumerWidget {
  final process;
  final processContent;
  final GlobalKey<FormState> globalKey;

  AddUserInfo({
    super.key,
    required this.process,
    required this.processContent,
    required this.globalKey,
  });

  // final globalKey = GlobalKey<FormState>();

  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                child: Column(
                  children: [
                    // 가이드 텍스트
                    ProcessGuideBox(content: processContent),

                    // 공간 여백
                    const SizedBox(height: 30),

                    // 성별 선택
                    SelectedGender(isShowed: process.value == ProfileEditProcess.gender),

                    // 생년월일
                    AddBirthTextForm(
                      // birthControlloer: userBirthDate,
                      hinText: "Birth day",
                      labelText: "Birth day",
                      isShowed: [ProfileEditProcess.gender, ProfileEditProcess.birthday].contains(process.value),
                    ),

                    // 닉네임 기본으로 보여줌
                    SettingNickName(
                      globalKey: globalKey,
                      usreNameController: userNameController,
                      hinText: "NickName",
                      labelText: "NickName",
                      isShowed: [ProfileEditProcess.birthday].contains(process.value),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
