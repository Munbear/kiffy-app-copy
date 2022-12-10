import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../widgets/common/confirm_button.dart';
import '../widget/introduce_text_form.dart';
import '../widget/selected_gender.dart';
import '../widget/selected_photos.dart';
import '../widget/setting_birth.dart';
import '../widget/setting_nick_name.dart';

class SettingProfileScreen extends ConsumerStatefulWidget {
  static String get routeName => 'setting';
  static String get routeLocation => '/setting';
  const SettingProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingProfileScreenState();
}

class _SettingProfileScreenState extends ConsumerState<SettingProfileScreen> {
  int currentNumber = 0;
  bool isShowedNickname = false;
  bool isShowedBirth = false;
  bool isShowedGender = false;
  bool isShowedIntroduce = false;
  bool isShowedPhoto = false;

  // 이름을
  String title = "nama";
  String guideText = "Dengan nama yang diatur di profil KIFFY, Tidak dapat diubah setelah ini.";

  void upDateGuideText() {
    setState(() {
      //이름
      if (currentNumber == 0) title;

      // 생년월일
      if (currentNumber == 1) title = "ultah";
      if (currentNumber == 1) guideText = "Masukkan tanggal lahir Anda.";

      // 성별
      if (currentNumber == 2) title = "jenis kelamin";
      if (currentNumber == 2) guideText = "Silakan pilih jenis kelamin.";

      // 사진
      // if (currentNumber == 3) title = "사진을 등록해 주세요";
      // 자기소개
      // if (currentNumber == 4) title = "자기소개를 작성해 주세요";
    });
  }

  void showNextStep() {
    setState(() {
      // 닉네임
      if (currentNumber == 0) isShowedNickname = !isShowedNickname;
      // 생년월일
      if (currentNumber == 1) isShowedBirth = !isShowedBirth;
      // 성별
      if (currentNumber == 2) isShowedGender = !isShowedGender;
      // if (currentNumber == 3) isOpacityPhoto = !isOpacityPhoto;
      // if (currentNumber == 4) isOpacityIntroduce = !isOpacityIntroduce;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 51, vertical: 20),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        title,
                        style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        guideText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              Form(
                child: Expanded(
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                    child: Column(
                      children: [
                        // // 자기소개
                        // IntroduceTextForm(isOpacity: isOpacityIntroduce),

                        // // 사진 선택
                        // SelectedPhotos(isOpacity: isOpacityPhoto),

                        // 성별 선택 :: 테스트
                        SelectedGender(isShowed: isShowedGender),

                        // 생년월일
                        AddBirthTextForm(hinText: "Birth day", labelText: "Birth day", isShowed: isShowedBirth),

                        // 닉네임 기본으로 보여줌
                        const SettingNickName(hinText: "NickName", labelText: "NickName"),
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
                    upDateGuideText();
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
