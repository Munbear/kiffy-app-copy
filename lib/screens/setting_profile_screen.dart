import 'package:flutter/material.dart';

import '../widgets/common/confirm_button.dart';
import '../widgets/setting_profile/introduce_text_form.dart';
import '../widgets/setting_profile/selected_gender.dart';
import '../widgets/setting_profile/selected_photos.dart';
import '../widgets/setting_profile/setting_birth.dart';
import '../widgets/setting_profile/setting_nick_name.dart';

class SettingProfileScreen extends StatefulWidget {
  const SettingProfileScreen({super.key});

  @override
  State<SettingProfileScreen> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends State<SettingProfileScreen> {
  bool isOpacityIntroduce = false;
  bool isOpacityPhoto = false;
  bool isOpacityBirth = false;
  bool isOpacityName = false;
  int currentNumber = 0;

  @override
  void onChagedOption() {
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
              Container(
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "성별을 선택해 주세요",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                          duration: Duration(milliseconds: 300),
                          child: IntroduceTextForm(isOpacity: isOpacityIntroduce),
                        ),
                        // 사진 선택
                        AnimatedOpacity(
                          opacity: isOpacityPhoto ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 300),
                          child: SelectedPhotos(isOpacity: isOpacityPhoto),
                        ),
                        // 생년월일
                        AnimatedOpacity(
                          opacity: isOpacityBirth ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
                          child: AddBirthTextForm(hinText: "Birth day", labelText: "Birth day", isOpacity: isOpacityBirth),
                        ),
                        // 닉네임
                        AnimatedOpacity(
                          opacity: isOpacityName ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 300),
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
                    onChagedOption();
                  });
                  print(currentNumber);
                  print(isOpacityName);
                },
                child: ConfirmButton(text: "확인"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
