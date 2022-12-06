import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/common/confirm_button.dart';
import '../widgets/setting_profile/introduce_text_form.dart';
import '../widgets/setting_profile/selected_gender.dart';
import '../widgets/setting_profile/selected_photos.dart';
import '../widgets/setting_profile/setting_birth.dart';
import '../widgets/setting_profile/setting_nick_name.dart';

class SettingProfileScreen extends ConsumerStatefulWidget {
  static String get routeName => 'setting';
  static String get routeLocation => '/setting';
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

  // 이름을
  String guideText = "nama";

  void upDateGuodeText() {
    setState(() {
      // 생년월일
      if (currentNumber == 1) guideText = "ultah";
      // 성별
      if (currentNumber == 2) guideText = "jenis kelamin";
      // if (currentNumber == 3) guideText = "사진을 등록해 주세요";
      // if (currentNumber == 4) guideText = "자기소개를 작성해 주세요";
    });
  }

  void showNextStep() {
    setState(() {
      if (currentNumber == 1) isOpacityName = !isOpacityName;
      if (currentNumber == 2) isOpacityBirth = !isOpacityBirth;
      // if (currentNumber == 3) isOpacityPhoto = !isOpacityPhoto;
      // if (currentNumber == 4) isOpacityIntroduce = !isOpacityIntroduce;
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
              Container(
                // color: Colors.red,
                height: 80,
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
                        // // 자기소개
                        // IntroduceTextForm(isOpacity: isOpacityIntroduce),

                        // // 사진 선택
                        // SelectedPhotos(isOpacity: isOpacityPhoto),

                        // 성별 선택 :: 테스트
                        const SelectedGender(),

                        // 생년월일
                        AddBirthTextForm(hinText: "Birth day", labelText: "Birth day", isOpacity: isOpacityBirth),

                        // 닉네임
                        SettingNickName(hinText: "NickName", labelText: "NickName", isOpacity: isOpacityName),
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
