import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widget/confirm_button.dart';
import '../widget/introduce_text_form.dart';
import '../widget/selected_gender.dart';
import '../widget/selected_photos.dart';
import '../widget/setting_birth.dart';
import '../widget/setting_nick_name.dart';

enum ProfileEditProcess {
  name,
  birthday,
  gender;
}

class ProfileEditProcessContent {
  late String title;
  late String guideText;

  ProfileEditProcessContent({required this.title, required this.guideText});

  factory ProfileEditProcessContent.of(ProfileEditProcess process) {
    switch (process) {
      case ProfileEditProcess.name:
        return ProfileEditProcessContent(title: "name", guideText: "이름을 입력해주세요");
      case ProfileEditProcess.gender:
        return ProfileEditProcessContent(title: "gender", guideText: "성별을 입력해주세요");
      case ProfileEditProcess.birthday:
        return ProfileEditProcessContent(title: "birthday", guideText: "생일을 입력해주세요");
    }
  }
}

class SettingProfileScreen extends HookConsumerWidget {
  static String get routeName => 'setting';
  static String get routeLocation => '/setting';

  const SettingProfileScreen({super.key});

  void processNextStep(ValueNotifier step) {
    switch (step.value) {
      case ProfileEditProcess.name:
        step.value = ProfileEditProcess.birthday;
        break;
      case ProfileEditProcess.birthday:
        step.value = ProfileEditProcess.gender;
        break;
      case ProfileEditProcess.gender:
        step.value = ProfileEditProcess.gender;
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var process = useState(ProfileEditProcess.name);
    var processContent = useState<ProfileEditProcessContent>(ProfileEditProcessContent.of(process.value));

    useValueChanged(process.value, (_, __) {
      processContent.value = ProfileEditProcessContent.of(process.value);
      return process.value;
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        processContent.value.title,
                        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        processContent.value.guideText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Form(
                child: Expanded(
                  child: SingleChildScrollView(
                    child: SizedBox(
                      child: Column(
                        children: [
                          // // 자기소개
                          // IntroduceTextForm(isOpacity: isOpacityIntroduce),

                          // // 사진 선택
                          // SelectedPhotos(isOpacity: isOpacityPhoto),

                          // 성별 선택 :: 테스트
                          SelectedGender(isShowed: process.value == ProfileEditProcess.gender),

                          // 생년월일
                          AddBirthTextForm(
                              hinText: "Birth day",
                              labelText: "Birth day",
                              isShowed: [ProfileEditProcess.gender, ProfileEditProcess.birthday].contains(process.value)),

                          // 닉네임 기본으로 보여줌
                          const SettingNickName(hinText: "NickName", labelText: "NickName"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  processNextStep(process);
                },
                child: const ConfirmButton(text: "확인"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
