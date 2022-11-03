import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/common/confirm_button.dart';
import '../widgets/setting_profile/introduce_text_form.dart';
import '../widgets/setting_profile/selected_gender.dart';
import '../widgets/setting_profile/selected_photos.dart';
import '../widgets/setting_profile/setting_birth.dart';
import '../widgets/setting_profile/setting_nick_name.dart';

class SettingProfileScreen extends ConsumerStatefulWidget {
  const SettingProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends ConsumerState<SettingProfileScreen> {
  int currentNumber = 0;
  bool isOpacityIntroduce = false;
  bool isOpacityPhoto = false;
  bool isOpacityBirth = false;
  bool isOpacityName = false;

  String guideText = "성별을 선택해 주세요";

  void upDateGuodeText() {
    setState(() {
      if (currentNumber == 1) guideText = "사용하실 닉네임을 입력해주세요";
      if (currentNumber == 2) guideText = "생년월일을 입력해 주세요";
      if (currentNumber == 3) guideText = "사진을 등록해 주세요";
      if (currentNumber == 4) guideText = "자기소개를 작성해 주세요";
    });
  }

  void showNextStep() {
    setState(() {
      if (currentNumber == 1) isOpacityName = !isOpacityName;
      if (currentNumber == 2) isOpacityBirth = !isOpacityBirth;
      if (currentNumber == 3) isOpacityPhoto = !isOpacityPhoto;
      if (currentNumber == 4) isOpacityIntroduce = !isOpacityIntroduce;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    guideText,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Form(
                child: Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        AnimatedOpacity(
                          opacity: isOpacityIntroduce ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: IntroduceTextForm(isOpacity: isOpacityIntroduce),
                        ),
                        // 사진 선택
                        AnimatedOpacity(
                          opacity: isOpacityPhoto ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: SelectedPhotos(isOpacity: isOpacityPhoto),
                        ),
                        // 생년월일
                        AnimatedOpacity(
                          opacity: isOpacityBirth ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: AddBirthTextForm(hinText: "Birth day", labelText: "Birth day", isOpacity: isOpacityBirth),
                        ),
                        // 닉네임
                        AnimatedOpacity(
                          opacity: isOpacityName ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 500),
                          child: SettingNickName(hinText: "NickName", labelText: "NickName", isOpacity: isOpacityName),
                        ),
                        // 성별 선택
                        SelectedGender(),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    currentNumber++;
                    showNextStep();
                    upDateGuodeText();
                  });
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
